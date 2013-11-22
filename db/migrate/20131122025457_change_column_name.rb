class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :dishes, :dish_pic, :image
  end
end
