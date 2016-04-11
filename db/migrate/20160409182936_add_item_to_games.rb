class AddItemToGames < ActiveRecord::Migration
  def change
    add_column :games, :item0, :integer
  end
end
