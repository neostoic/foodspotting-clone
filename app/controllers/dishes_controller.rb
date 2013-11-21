class DishesController < ApplicationController

  def index
    @dishes = Dish.all
  end

  def show
    load_dish
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to dishes_path
    else
      render :new
    end
  end

  def update
    load_dish

    if @dish.update_attributes(dish_params)
      redirect_to dish_path(@dish)
    else
      render :edit
    end
  end

  def edit
    load_dish
  end

  def destroy
    load_dish
    @dish.destroy
    redirect_to dishes_path
  end

  protected

  def dish_params
    params.require(:dish).permit(:title, :description, :city, :user_id)
  end

  def load_dish
    @dish = Dish.find(params[:dish_id])
  end

end
