class FrontendController < ApplicationController

  def selectTable

    respond_to do |format|
      format.html
      format.mobile
    end

  end

  def receiveSelectedTable
      @selectedTable = params[:tableNumber]
      redirect_to :action => "selectOrderItem", :selectedTable => @selectedTable
  end

  def selectOrderItem

    @selectedTable = params[:selectedTable]
    respond_to do |format|
      format.html
      format.mobile
    end

  end

end
