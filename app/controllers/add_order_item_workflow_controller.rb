class AddOrderItemWorkflowController < ApplicationController

  def start
    @orderId = params[:order_id]
    redirect_to :action => "selectCategory", :order_id => @orderId
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
