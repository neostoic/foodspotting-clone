class DishesController < ApplicationController

  before_action :restrict_access, except: [:index]
  before_action :load_dish, only: [:show, :update, :edit, :destroy, :like]

  def index
    @dishes = Dish.all
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def create
    
    # @dish = Dish.new(dish_params)
    # @dish.user = current_user
    @dish = current_user.dishes.new(dish_params)
    binding.pry

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
    @dish.destroy
    redirect_to dishes_path
  end

  protected

  def load_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:title, :description, :city, :image)
  end

end
