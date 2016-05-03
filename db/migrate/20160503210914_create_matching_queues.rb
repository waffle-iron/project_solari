class CreateMatchingQueues < ActiveRecord::Migration
  def change
    create_table :matching_queues do |t|
      t.integer :user_id
      t.integer :match_id
      t.integer :primary_role
      t.integer :secondary_role

      t.timestamps null: false
    end
  end
end
