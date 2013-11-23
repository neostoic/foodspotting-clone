class ChangeLikesColumnName < ActiveRecord::Migration
  def change
  	rename_column :likes, :comment, :num_likes
  end
end
