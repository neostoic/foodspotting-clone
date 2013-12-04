class AddFieldsToSubscriptions < ActiveRecord::Migration
  def change
	  change_table :subscriptions do |t|
	    t.integer  :user_id
	    t.datetime :start_date
	    t.datetime :end_date
	    t.string	 :status
	    t.datetime :last_payment_date
	    t.integer  :num_failures
	  end
	end
end
