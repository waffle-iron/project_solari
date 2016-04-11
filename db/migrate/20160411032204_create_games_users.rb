class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users, id: false do |t|
      t.references :game, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
