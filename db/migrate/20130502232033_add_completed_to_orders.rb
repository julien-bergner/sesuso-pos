class AddCompletedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_completed, :boolean
  end
end
