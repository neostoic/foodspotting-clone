class LikesController < ApplicationController
	before_action :restrict_access

	def create
    Like.create(dish_id: params[:dish_id], user_id: current_user.id)
    redirect_to dishes_path
  end

  def destroy
    Like.where(params[:dish_id]).where(current_user.id).first.destroy
    redirect_to dishes_path
  end

  def num_likes
  	likes = Like.where(params[:dish_id]).count
  	"#{likes}"
  end

end
