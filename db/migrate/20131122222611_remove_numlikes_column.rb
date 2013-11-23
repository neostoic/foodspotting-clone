class RemoveNumlikesColumn < ActiveRecord::Migration
  def change
  	remove_column :likes, :num_likes
  end
end
