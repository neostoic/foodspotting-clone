class AddRestaurantToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :restaurant, :string
  end
end
