class ChangeGameModeToGame < ActiveRecord::Migration
  def change
  	change_column :games, :game_mode, :integer
  end
end
