class RenameMatchIdToMatchigQueue < ActiveRecord::Migration
  def change
    rename_column :matching_queues, :match_id, :matching_id
  end
end
