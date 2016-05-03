class AddHplydayToUser < ActiveRecord::Migration
  def change
    add_column :users, :play_holyday_morning, :boolean
    add_column :users, :play_holyday_noon, :boolean
    add_column :users, :play_holyday_night, :boolean
    add_column :users, :play_holyday_latenight, :boolean
  end
end
