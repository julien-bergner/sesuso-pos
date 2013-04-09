class Product < ActiveRecord::Base
  attr_accessible :caption, :category_id, :number, :price

  belongs_to :category
  has_many :order_items
end
