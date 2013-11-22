class AddDishPicToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :dish_pic, :string
  end
end
