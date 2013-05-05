class FrontendController < ApplicationController

  def startAddOrderWorkflow
    redirect_to :action => "selectTable"
  end


  def selectTable

    respond_to do |format|
      format.html
      format.mobile
    end

  end

  def receiveSelectedTable
    @selectedTableNumber = params[:tableNumber]
    redirect_to :action => "createOrderIfNotExisting", :selectedTableNumber => @selectedTableNumber
  end

  def createOrderIfNotExisting
    @selectedTableNumber = params[:selectedTableNumber]
    @restaurantTable = RestaurantTable.find_by_number(@selectedTableNumber)

    if @restaurantTable.nil?
      redirect_to :action => "startAddOrderWorkflow", :flash => "Dieser Tisch existiert nicht."
    else
      @orders = Order.find_all_by_restaurant_table_id(@restaurantTable.id)
      @orders.select! { |order| !order.is_completed }
      if @orders.count == 1
        @order = @orders.first
      else
        @order = Order.create!(:restaurant_table_id => @restaurantTable.id, :is_completed => false)
      end
      redirect_to :action => "showOrder", :order_id => @order.id

    end
  end

  def increaseOrderItemQuantity
    @order_item_id = params[:order_item_id]
    orderItem = OrderItem.find(@order_item_id)
    orderItem.quantity += 1
    orderItem.save
    redirect_to :action => "showOrder", :order_id => orderItem.order.id
  end

  def decreaseOrderItemQuantity
    @order_item_id = params[:order_item_id]
    orderItem = OrderItem.find(@order_item_id)
    if orderItem.quantity < 2
      orderItem.delete
    else
      orderItem.quantity -= 1
      orderItem.save
    end

    redirect_to :action => "showOrder", :order_id => orderItem.order.id
  end


  def showOrder
    @order_id = params[:order_id]
    @order = Order.find(@order_id)
    @order_items_grouped_by_categories = @order.order_items.group_by { |orderItem| orderItem.product.category }
  end

  def showAllOrders

    @orders = Order.all


  end

end
