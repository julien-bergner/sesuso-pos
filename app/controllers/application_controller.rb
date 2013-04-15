class ApplicationController < ActionController::Base
  include Mobylette::RespondToMobileRequests
  protect_from_forgery
  before_filter :set_request_format

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def set_request_format
    if is_mobile_request? && request.format.to_s == "text/html"
      request.format = :mobile
    elsif is_mobile_request? && request.format.to_s == "text/javascript"
      request.format = :mobilejs
    end
  end

end
