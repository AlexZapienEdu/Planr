class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.integer :dinner_spots_count
      t.integer :events_count
      t.integer :dessert_spots_count

      t.timestamps
    end
  end
end
