class Admin::UsersController < ApplicationController

	def index
		if current_user.admin == true
			@users = User.all
		else
			redirect_to dishes_path, notice: "Cannot access the admin dashboard!"
		end
	end

	def destroy
		@user = User.find(params[:id])
    if current_user.admin == true
      @user.destroy
      redirect_to admin_users_path, notice: "Account deleted successfully!"
    else
      redirect_to dishes_path, notice: "Cannot delete another user's account!"
    end
  end

end