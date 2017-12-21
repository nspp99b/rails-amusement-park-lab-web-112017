class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authorized
  helper_method :current_user
  # def is_admin?(user)
  #   current_user.admin
  # end

  def current_user
  	if session[:user_id]
  	   User.find(session[:user_id])
  	else
  	   nil
  	end
  end

  def logged_in?
	   !!current_user
  end

  def authorized
    if !logged_in?
      redirect_to login_path
	  end
  end

end
