class ChangeLikesColumn < ActiveRecord::Migration
  def change
  	change_column :likes, :comment, :integer
  end
end
