class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from Exception, :with => :error_render_method

  def error_render_method
    respond_to do |type|
      type.html { render :template => "errors/error_404", :status => 404 }
      type.all  { render :nothing => true, :status => 404 }
    end
    true
  end

  def foursquare
    @foursquare ||= Foursquare::Base.new(session[:access_token])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
