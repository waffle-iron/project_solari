class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :game_id
      t.integer :champion_id
      t.datetime :create_date
      t.string :game_mode
      t.integer :spell_1
      t.integer :spell_2
      t.integer :item1
      t.integer :item2
      t.integer :item3
      t.integer :item4
      t.integer :item5
      t.integer :item6
      t.integer :time_played
      t.integer :death
      t.integer :kill
      t.integer :assist

      t.timestamps null: false
    end
  end
end
