class CreateRestaurantTables < ActiveRecord::Migration
  def change
    create_table :restaurant_tables do |t|
      t.integer :number
      t.string :caption
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
