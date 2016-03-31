class CreateAchievementsUsers < ActiveRecord::Migration
  def change
    create_table :achievements_users, id:false do |t|
      t.references :user, index: true, null: false
      t.references :achievement, index: true, null: false
    end
  end
end
