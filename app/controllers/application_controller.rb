class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :after_token_authentication

  def foursquare
    @foursquare ||= Foursquare::Base.new(session[:access_token])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def after_token_authentication
    if params[:authentication_key].present?
      @user = User.find_by_authentication_token(params[:authentication_key])
      sign_in @user if @user 
      redirect_to root_path 
    end
    # probar con: http://localhost:3000/users/sign_in? authentication_key=xyz1234rst
  end
end
