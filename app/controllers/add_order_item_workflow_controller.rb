class AddOrderItemWorkflowController < ApplicationController

  def start
    @orderId = params[:order_id]
    redirect_to :action => "selectCategory", :order_id => @orderId
  end



  def selectCategory
    @orderId = params[:order_id]
    @categories = Category.all

  end

  def receiveSelectedCategory
    @selectedCategoryId = params[:selectedCategory]
    @orderId = params[:order_id]
    redirect_to :action => "selectProduct", :selectedCategoryId => @selectedCategoryId, :order_id => @orderId
  end

  def selectProduct
    @selectedCategoryId = params[:selectedCategoryId]
    @selectedCategory = Category.find(@selectedCategoryId)
    @orderId = params[:order_id]
    @products = Product.find_all_by_category_id(@selectedCategoryId)

    respond_to do |format|
      format.html
      format.mobile
    end

  end

  def receiveSelectedProduct
    @orderId = params[:order_id]
    @productId = params[:product_id]

    @order = Order.find(@orderId)
    @product = Product.find(@productId)

    @order.addOrderItem(@product)

    redirect_to :controller => "frontend", :action => "showOrder", :order_id => @orderId
  end


end
