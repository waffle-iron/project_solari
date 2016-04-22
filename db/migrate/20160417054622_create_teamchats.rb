class CreateTeamchats < ActiveRecord::Migration
  def change
    create_table :teamchats do |t|
      t.references :team, null: false
      t.references :user, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
