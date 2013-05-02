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

  def selectCategory

    @categories = Category.all

  end

  def receiveSelectedCategory
    @selectedCategory = params[:selectedCategory]
    redirect_to :action => "selectProduct", :selectedCategory => @selectedCategory
  end

  def selectProduct
    @selectedCategory = params[:selectedCategory]
    @products = Product.find_all_by_category_id(@selectedCategory)

    respond_to do |format|
      format.html
      format.mobile
    end

  end


  def selectOrderItem

    @selectedTableNumber = params[:tableNumber]
    respond_to do |format|
      format.html
      format.mobile
    end

  end



end
