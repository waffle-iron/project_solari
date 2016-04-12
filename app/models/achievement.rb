class Achievement < ActiveRecord::Base
	enum achievement_type: { create_team: 0, join_team: 1, test: 2, triple_kill_aram: 3, double_kill_aram: 4, quadra_kill_aram: 5, penta_kill_aram: 6}
	enum difficulty: {easy:0, normal: 1, hard: 2, god:3}
	enum gametype: {ranked:0, aram:1}

	has_many :achievement_users
	has_many :users, through: :achievement_users
end
