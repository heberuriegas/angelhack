class ApplicationController < ActionController::Base
  protect_from_forgery

  def foursquare
    @foursquare ||= Foursquare::Base.new(session[:access_token])
  end

  rescue_from Exception do |exception|
    Rails.logger.error exception.message

    respond_to do |format|
      format.html { render :template => "errors/error_404", :status => 404 }
      #format.json { render json: {error: exception.message} }
      format.all  { render :nothing => true, :status => 404 }
    end
    true
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
