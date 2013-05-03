class Order < ActiveRecord::Base
  attr_accessible :restaurant_table_id, :is_completed

  belongs_to :restaurant_table
  has_many :order_items


  def addOrderItem(product)

    @existingOrderItems = self.order_items
    @orderItemsWithProductId = @existingOrderItems.select{|oi| oi.product_id == product.id}

    if @orderItemsWithProductId.empty?
      # Create new order item
      OrderItem.createOrderItem(self, product)

    elsif @orderItemsWithProductId.size == 1
      # Increase quantity of existing order item
      orderItem = @orderItemsWithProductId.first
      orderItem.quantity += 1
      orderItem.save

    else
      # Invalid state
      raise Exception

    end


  end

end
