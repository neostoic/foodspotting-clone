class AddRestaurantOwnerToUser < ActiveRecord::Migration
  def change
    add_column :users, :restaurant_owner, :boolean
  end
end
