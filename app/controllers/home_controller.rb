class HomeController < ApplicationController

	def index
      client = Taric.client(region: :jp)
      userName = current_user.summoner_name
      data = client.summoners_by_names(summoner_names: userName)
      @summonerInfo = data.body[userName]
      data_games = client.recent_games(summoner_id: @summonerInfo["id"])
      @gameInfo = data_games.body["games"]

      realm = client.static_realm
      @image_url = realm.body["cdn"] + "/" + realm.body["v"]

	    @gameInfo.each {|game|
        stats = game["stats"]
        if Game.find_by(:game_id => game["gameId"]).blank?
          if game["subType"] == "ARAM_UNRANKED_5x5"
            gameRecord = Game.create!({
              :game_id => game["gameId"],
              :champion_id => game["championId"],
              :create_date => Time.at(game["createDate"] / 1000.0),
              :game_mode => game["subType"],
              :spell_1 => game["spell1"],
              :spell_2 => game["spell2"],
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
            current_user.games << gameRecord
            current_user.save
          end
        end
      }

	end

end
