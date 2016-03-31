class Achievement < ActiveRecord::Base
	enum achievement_type: { create_team: 0, join_team: 1}
	enum difficulty: {easy:0, normal: 1, hard: 2, god:3}
end
