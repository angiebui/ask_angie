module ApplicationHelper

  def user_signed_in?
    return true if session[:id]
    return false
  end

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end
 
end
