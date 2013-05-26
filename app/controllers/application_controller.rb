class ApplicationController < ActionController::Base
  protect_from_forgery

  def foursquare
    @foursquare ||= Foursquare::Base.new(session[:access_token])
  end

  rescue_from ActionController::RoutingError do |exception|
    Rails.logger.error exception.message

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false }
      format.all  { render :nothing => true, :status => 404 }
    end
    true
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  rescue_from Exception do |exception|
    Rails.logger.error exception.message

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/500.html", :status => 500, :layout => false }
      format.all  { render :nothing => true, :status => 500 }
    end
    true
  end

end
