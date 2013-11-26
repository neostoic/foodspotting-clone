class UsersController < ApplicationController
	before_action :restrict_access, except: [:index]
	before_action :load_user, only: [:show, :update, :edit]

	def new
		@user = User.new
	end

	def show
	end

	def edit
	end

	def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

	def create 
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id # auto log in
			redirect_to dishes_path, notice: "Welcome, #{@user.first_name}!"
		else
			render :new
		end
	end

	protected

	def load_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
	end

end
