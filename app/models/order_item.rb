class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity

  belongs_to :order
  belongs_to :product

  def self.createOrderItem(order, product)
    orderItem = OrderItem.new
    orderItem.order_id = order.id
    orderItem.product_id = product.id
    orderItem.save
  end

end
