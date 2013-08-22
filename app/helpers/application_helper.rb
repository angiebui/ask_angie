module ApplicationHelper

  def user_signed_in?
    # REVIEW: couldn't we just replace this code with current_user.present?
    return true if session[:id]
    return false
  end

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

end
