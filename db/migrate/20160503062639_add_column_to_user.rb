class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :play_weekday_morning, :boolean
    add_column :users, :play_weekday_noon, :boolean
    add_column :users, :play_weekday_night, :boolean
    add_column :users, :play_weekday_latenight, :boolean
  end
end
