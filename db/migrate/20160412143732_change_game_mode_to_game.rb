class ChangeGameModeToGame < ActiveRecord::Migration
  def change
  	change_column :games, :game_mode, :integer
#  	change_column :Games, :game_mode, :integer
    change_column :games, :game_mode, :integer
  end
end
