class AchievementUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :achievement
	has_and_belongs_to_many :game
end
