class Category < ActiveRecord::Base
  attr_accessible :caption

  has_many :products

end
