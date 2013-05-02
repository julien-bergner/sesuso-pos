class AddOrderItemWorkflowController < ApplicationController

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

  def selectCategory

    @categories = Category.all

  end

  def receiveSelectedCategory
    @selectedCategoryId = params[:selectedCategory]
    redirect_to :action => "selectProduct", :selectedCategoryId => @selectedCategoryId
  end

  def selectProduct
    @selectedCategoryId = params[:selectedCategoryId]
    @selectedCategory = Category.find(@selectedCategoryId)
    @products = Product.find_all_by_category_id(@selectedCategoryId)

    respond_to do |format|
      format.html
      format.mobile
    end

  end

end
