class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :summoner_name, :string
  end
end
