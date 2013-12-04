class DishesController < ApplicationController

  before_action :restrict_access, except: [:index]
  before_action :load_dish, only: [:show, :update, :edit, :destroy, :like]

  def index
    #Refactor
    if params[:city]
      @dishes = Dish.where(city: params[:city])
    elsif params[:search]
      @dishes = Dish.where("title like ?", "%#{params[:search]}%")
    elsif params[:restaurant]
      @dishes = Dish.where(restaurant: params[:restaurant])
    else
      @dishes = Dish.all
    end
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = current_user.dishes.new(dish_params)

    if @dish.save
      redirect_to dishes_path, notice: "#{@dish.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    if @dish.update_attributes(dish_params)
      redirect_to dish_path(@dish)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    if current_user.id == @dish.user_id
      @dish.destroy
      redirect_to dishes_path, notice: "#{@dish.title} was deleted successfully!"
    else
      redirect_to dishes_path, notice: "Cannot delete another user's dish!"
    end
  end

  protected

  def load_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:title, :description, :city, :image, :restaurant)
  end

end
