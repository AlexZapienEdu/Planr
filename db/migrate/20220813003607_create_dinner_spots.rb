class CreateDinnerSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :dinner_spots do |t|
      t.string :loc_name
      t.integer :visitor_id
      t.integer :category_id
      t.text :desc
      t.string :image

      t.timestamps
    end
  end
end
