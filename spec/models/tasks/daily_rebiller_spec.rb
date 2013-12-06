require 'spec_helper'

describe Tasks::DailyRebiller do
	context "#find_subscriptions_for_billing" do
		it "should find 2 subscriptions objects" do
			@subscription_1 = FactoryGirl.create :subscription, last_payment_date: Date.today.advance(months: -1, days: -2)
			@subscription_2 = FactoryGirl.create :subscription, last_payment_date: Date.today.advance(months: -1, days: -3)
			@subscription_3 = FactoryGirl.create :subscription, last_payment_date: Date.today
			expect(Tasks::DailyRebiller.new.find_subscriptions_for_billing).to eq([@subscription_1, @subscription_2])
		end
	end

	context "#one_month_ago"
		it "should find a month old subscription object" do
			@subscription = FactoryGirl.create :subscription, last_payment_date: Date.today.advance(months: -1, days: -2)
			Tasks::DailyRebiller.new.find_subscriptions_for_billing
			expect(Subscription.count).to eq(1)
		end

	context "#run" do
		it "should charge all subscriptions that are due" do
			@stripe_charge_double = double(:paid? => true)
			expect(Stripe::Charge).to receive(:create).and_return(@stripe_charge_double)
			@subscription_1 = FactoryGirl.create :subscription, last_payment_date: Date.today.advance(months: -1)
			next_payment_date = @subscription_1.next_payment_date
			Tasks::DailyRebiller.new.run()
			expect(@subscription_1.payments.count).to eq(1)
			expect(next_payment_date).to eq(next_payment_date.advance(months: +1))
		end
	end
end