class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to_mobile_requests :skip_xhr_requests => false

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
