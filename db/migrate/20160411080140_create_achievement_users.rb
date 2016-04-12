class CreateAchievementUsers < ActiveRecord::Migration
  def change
    create_table :achievement_users do |t|
      t.integer :achievement_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
