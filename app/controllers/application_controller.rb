class ApplicationController < ActionController::Base
  protect_from_forgery

  def foursquare
    @foursquare ||= Foursquare::Base.new(session[:access_token])
  end
end
