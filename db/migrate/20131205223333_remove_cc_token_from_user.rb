class RemoveCcTokenFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :cc_token, :string
  end
end
