class AddTeamonlychatsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :teamonlychats_count, :intefer, default: 0
  end
end
