class Restaurant < ActiveRecord::Base
  attr_accessible :caption

  has_many :restaurant_tables
  has_many :orders, :through => :restaurant_tables
  has_many :order_items, :through => :orders

end
