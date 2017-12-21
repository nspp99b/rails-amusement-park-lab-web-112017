class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
   	@user = User.find_by(name: params[:name])
	  if @user && @user.authenticate(params[:password])
    	session[:user_id] = @user.id
    	flash[:msg] = "you’re good dude"
    	redirect_to user_path(@user)
    else
    	flash[:error] = ["name and pw do not match"]
    	redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end

end
