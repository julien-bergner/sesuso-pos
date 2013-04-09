class RestaurantTable < ActiveRecord::Base
  attr_accessible :caption, :number, :restaurant_id

  belongs_to :restaurant
  has_many :orders
  has_many :order_items, :through => :orders

end
