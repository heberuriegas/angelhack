class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter { puts current_user.role unless current_user.nil? }

  def foursquare
    @foursquare ||= Foursquare::Base.new(session[:access_token])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
