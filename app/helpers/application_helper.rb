module ApplicationHelper
  
  def user_signed_in?
    return true if session[:id]
    return false
  end


end
