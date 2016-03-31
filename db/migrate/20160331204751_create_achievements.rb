class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :achievement_type
      t.string :name
      t.string :description
      t.string :image
      t.integer :count
      t.integer :difficulty
      t.string :requirement

      t.timestamps null: false
    end
  end
end
