class CreateMatchings < ActiveRecord::Migration
  def change
    create_table :matchings do |t|
      t.integer :queue_type
      t.boolean :under30
      t.boolean :unranked
      t.boolean :bronze
      t.boolean :silver
      t.boolean :gold
      t.boolean :plutinum
      t.boolean :diamond
      t.boolean :master
      t.boolean :challenger
      t.datetime :deadline

      t.timestamps null: false
    end
  end
end
