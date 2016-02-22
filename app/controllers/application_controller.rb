class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   helper_method :current_user

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
