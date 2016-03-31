class CreateUsersAchievements < ActiveRecord::Migration
  def change
    create_table :users_achievements, id:false do |t|
      t.references :user, index: true, null: false
      t.references :achievement, index: true, null: false
    end
  end
end
