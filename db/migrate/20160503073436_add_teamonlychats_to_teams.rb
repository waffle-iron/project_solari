class AddTeamonlychatsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :teamonlychats_count, :integer, default: 0
  end
end
