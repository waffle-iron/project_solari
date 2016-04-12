class Game < ActiveRecord::Base

  enum game_mode: [:NONE, :NORMAL, :BOT, :RANKED_SOLO_5x5, :RANKED_PREMADE_3x3, :RANKED_PREMADE_5x5, :ODIN_UNRANKED, :RANKED_TEAM_3x3, :RANKED_TEAM_5x5, :NORMAL_3x3, :BOT_3x3, :CAP_5x5, :ARAM_UNRANKED_5x5, :ONEFORALL_5x5, :FIRSTBLOOD_1x1, :FIRSTBLOOD_2x2, :SR_6x6, :URF, :URF_BOT, :NIGHTMARE_BOT, :ASCENSION, :HEXAKILL, :KING_PORO, :COUNTER_PICK, :BILGEWATER]

  has_and_belongs_to_many :achievement_users
  has_and_belongs_to_many :users
end
