class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_signed_in?
    return true if session[:id]
    return false
  end

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

  helper_method :current_user
  helper_method :user_signed_in?
  
end
