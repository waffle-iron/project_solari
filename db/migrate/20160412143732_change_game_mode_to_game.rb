class ChangeGameModeToGame < ActiveRecord::Migration
  def change
  	change_column :Games, :game_mode, :integer
  end
end
