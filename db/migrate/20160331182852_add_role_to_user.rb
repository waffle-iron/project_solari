class AddRoleToUser < ActiveRecord::Migration
  def change
  	# 追加
    add_column :users, :champion_role, :integer
  end
end
