class AddRolesPointToMatching < ActiveRecord::Migration
  def change
    add_column :matchings, :top_point, :integer
    add_column :matchings, :mid_point, :integer
    add_column :matchings, :bot_point, :integer
    add_column :matchings, :sup_point, :integer
    add_column :matchings, :jg_point, :integer
  end
end
