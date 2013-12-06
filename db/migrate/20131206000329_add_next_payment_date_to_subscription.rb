class AddNextPaymentDateToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :next_payment_date, :datetime
  end
end
