class AddWinToGames < ActiveRecord::Migration
  def change
    add_column :games, :win, :boolean
  end
end
