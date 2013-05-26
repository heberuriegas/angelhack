class ApplicationController < ActionController::Base
  protect_from_forgery

  def foursquare
    @foursquare ||= Foursquare::Base.new(session[:access_token])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
