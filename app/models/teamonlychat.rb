class Teamonlychat < ActiveRecord::Base
  belongs_to :user
  belongs_to :team, counter_cache: true

  def is_valid?()
    Team.find(self.team_id).user_ids.include?(self.user_id)
  end
end
