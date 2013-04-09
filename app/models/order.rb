class Order < ActiveRecord::Base
  attr_accessible :restaurant_table_id

  belongs_to :restaurant_table
  has_many :order_items
end
