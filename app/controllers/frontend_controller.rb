class FrontendController < ApplicationController

  def selectTable

    respond_to do |format|
      format.html
      format.mobile
    end

  end

  def receiveSelectedTable
      @selectedTableNumber = params[:tableNumber]
      @restaurant_table = RestaurantTable.find_by_number(@selectedTableNumber)
      @order = @restaurant_table.orders.first

      redirect_to order_path(@order)
      #redirect_to :action => "selectOrderItem", :selectedTableNumber => @selectedTableNumber
  end

  def selectOrderItem

    @selectedTableNumber = params[:tableNumber]
    respond_to do |format|
      format.html
      format.mobile
    end

  end

end
