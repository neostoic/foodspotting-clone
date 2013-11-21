class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :dish_id
      t.string :title
      t.string :city

      t.timestamps
    end
  end
end
