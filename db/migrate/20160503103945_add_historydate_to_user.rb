class AddHistorydateToUser < ActiveRecord::Migration
  def change
    add_column :users, :match_updated_at, :datetime
  end
end
