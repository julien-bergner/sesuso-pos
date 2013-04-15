class FrontendController < ApplicationController

  def selectTable

    respond_to do |format|
      format.html # index.html.erb
      format.mobile
      format.json { render json: @products }
    end

  end

end
