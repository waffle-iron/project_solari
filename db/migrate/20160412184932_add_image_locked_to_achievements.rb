class AddImageLockedToAchievements < ActiveRecord::Migration
  def up
  	add_column :achievements ,:image_locked, :string
  end
end
