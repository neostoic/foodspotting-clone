class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to dishes_path, notice: "Welcome back, #{user.first_name}!"
  	else
  		flash.new[:alert] = "Log in failed..."
  		render :new
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to dishes_path, notice: "Come again soon!"
  end
end
