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

  def showOrder
    @order_id = params[:order_id]
    @order = Order.find(@order_id)
  end

  def showAllOrders

    @orders = Order.all

  end

end
