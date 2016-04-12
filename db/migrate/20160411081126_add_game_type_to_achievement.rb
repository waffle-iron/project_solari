class AddGameTypeToAchievement < ActiveRecord::Migration
  def change
    add_column :achievements, :gametype, :integer
  end
end
