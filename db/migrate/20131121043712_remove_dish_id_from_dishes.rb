class RemoveDishIdFromDishes < ActiveRecord::Migration
  def change
    remove_column :dishes, :dish_id, :string
  end
end
