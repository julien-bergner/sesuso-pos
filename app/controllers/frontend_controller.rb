class FrontendController < ApplicationController

  def selectTable

    respond_to do |format|
      format.html
      format.mobile
    end

  end

  def showOrder

  end

  def showAllOrders

  end

end
