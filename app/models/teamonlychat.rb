class Teamonlychat < ActiveRecord::Base
  belongs_to :user
  belongs_to :team, counter_cache: true

  def is_valid?()
    puts "=== is_valid ==="
    puts "team_id #{self.team_id} user_id #{self.user_id}"
    a = Team.find(self.team_id).users.include?(self.user_id)
    puts a
    return a
  end
end
