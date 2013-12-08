require 'spec_helper'

describe Tasks::DailyRebiller do
	before :each do 
		allow_any_instance_of(Subscription).to receive(:start_subscription)
	end

	context "#run" do
		it "should charge all subscriptions that are due" do
			FactoryGirl.create :subscription, last_payment_date: Date.today.advance(months: -1)
      fake_subscription_charge = double(:charge! => nil)
      expect(fake_subscription_charge).to receive(:charge!).once
      expect(SubscriptionCharge).to receive(:new).once.and_return(fake_subscription_charge)
      Tasks::DailyRebiller.new.run
		end

		it "does not perform a subscription charge for one that was charged less than a month ago" do
			subs = FactoryGirl.create :subscription
			subs.update_attributes last_payment_date: 2.days.ago, next_payment_date: 28.days.from_now
			expect(SubscriptionCharge).to_not receive(:new)
			Tasks::DailyRebiller.new.run
		end
	end
end