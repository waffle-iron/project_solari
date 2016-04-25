class AddTeamchatsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :teamchats_count, :integer, default: 0
  end
end
