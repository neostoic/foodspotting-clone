class SessionsController < ApplicationController

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to dishes_path, notice: "Welcome back, #{user.first_name}!"
  	else
  		redirect_to dishes_path, notice: "Login Failed"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to dishes_path, notice: "Come again soon!"
  end
end
