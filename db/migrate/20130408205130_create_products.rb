class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :number
      t.string :caption
      t.float :price
      t.integer :category_id

      t.timestamps
    end
  end
end
