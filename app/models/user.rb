class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :teams
  has_many :achievement_users
  has_many :achievements, through: :achievement_users
  has_and_belongs_to_many :games
  has_many :teamchats
  has_many :teamonlychats
  has_one :matching_queue

  enum champion_role: { fill: 0, bot: 1, support: 2, mid: 3, top: 4, jungle: 5}

  def has_role?(name)
    self.roles.where(name: name).length > 0
  end

  def refresh_match_history
    client = Taric.client(region: :jp)
    data = client.summoners_by_names(summoner_names: summoner_name)
    @summonerInfo = data.body[summoner_name]
    data_games = client.recent_games(summoner_id: @summonerInfo["id"])
    @gameInfo = data_games.body["games"]
    unlock_achievements = []
    refresh_count = 0

    @gameInfo.each {|game_raw|
      stats = game_raw["stats"]

      if Game.find_by(:game_id => game_raw["gameId"]).blank?
        refresh_count += 1
        #TODO 絞り込み条件どうする？
        if game_raw["subType"] == "ARAM_UNRANKED_5x5" || true
          gameRecord = Game.create!({
            :game_id => game_raw["gameId"],
            :champion_id => game_raw["championId"],
            :create_date => Time.at(game_raw["createDate"] / 1000.0),
            :game_mode => game_raw["subType"],
            :spell_1 => game_raw["spell1"],
            :spell_2 => game_raw["spell2"],
            :item0 => stats["item0"],
            :item1 => stats["item1"],
            :item2 => stats["item2"],
            :item3 => stats["item3"],
            :item4 => stats["item4"],
            :item5 => stats["item5"],
            :item6 => stats["item6"],
            :time_played => stats["timePlayed"],
            :death => stats["numDeaths"],
            :kill => stats["championsKilled"],
            :assist => stats["assists"],
            :win => stats["win"]
            })
          games << gameRecord
          save
          achieve = checkAchievements(gameRecord, game_raw)
          if(!achieve.empty?)
            unlock_achievements << achieve
          end
        end
      end
    }
    return unlock_achievements, refresh_count
  end

  private

  def checkAchievements(gameRecord, raw)
    all_achievements = Achievement.all
    unlock_achievements = []
    all_achievements.each do |achievement|
      if checkAchievement(gameRecord, achievement, raw)
        if(self.achievements.find_by(:achievement_type => achievement[:achievement_type]).blank?)
          self.achievements << achievement
          unlock_achievements << achievement
          save
        end
        achievementRelation = AchievementUser.find_by(:user => self, :achievement => achievement)
        achievementRelation.game << gameRecord
      end
    end
    return unlock_achievements
  end

  def checkAchievement(gameRecord, achievement, raw)

    case achievement.achievement_type.to_sym
      when :double_kill_aram then
        if gameRecord.game_mode == "ARAM_UNRANKED_5x5"
          if raw["stats"]["doubleKills"]
            return true
          end
        end
        return false
      when :double_kill_aram then
        if gameRecord.game_mode == "ARAM_UNRANKED_5x5"
          if raw["stats"]["doubleKills"]
            return true
          end
        end
        return false
      when :triple_kill_aram then
        if gameRecord.game_mode == "ARAM_UNRANKED_5x5"
          if raw["stats"]["tripleKills"]
            return true
          end
        end
        return false
      when :quadra_kill_aram then
        if gameRecord.game_mode == "ARAM_UNRANKED_5x5"
          if raw["stats"]["quadraKills"]
            return true
          end
        end
        return false
      when :penta_kill_aram then
        if gameRecord.game_mode == "ARAM_UNRANKED_5x5"
          if raw["stats"]["pentaKills"]
            return true
          end
        end
        return false
      when :double_kill_ranked then
        if gameRecord.game_mode == "RANKED_SOLO_5x5"
          if raw["stats"]["doubleKills"]
            return true
          end
        end
        return false
    end
  end
end
