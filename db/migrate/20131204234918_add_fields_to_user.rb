class AddFieldsToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string  :cc_token
  		t.string 	:card_token
  		t.string	:stripe_customer_token
  	end
  end
end
