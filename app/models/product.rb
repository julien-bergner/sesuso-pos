class Product < ActiveRecord::Base
  attr_accessible :caption, :category_id, :number, :price
end
