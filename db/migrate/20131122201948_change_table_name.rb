class ChangeTableName < ActiveRecord::Migration
  def change
  	rename_table :comments, :likes
  end
end
