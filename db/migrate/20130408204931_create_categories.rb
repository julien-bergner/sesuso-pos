class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :caption

      t.timestamps
    end
  end
end
