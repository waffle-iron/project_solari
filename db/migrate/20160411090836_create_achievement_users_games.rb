class CreateAchievementUsersGames < ActiveRecord::Migration
  def change
    create_table :achievement_users_games do |t|
      t.references :achievement_user, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
    end
  end
end
