require 'spec_helper'

describe SubscriptionCharge do
	before :each do 
  	@subscription = FactoryGirl.create :subscription
  	@sc = SubscriptionCharge.new(@subscription)
	end
	
	context "#charge!" do
		it "should attempt to create a new charge through Stripe" do
			stripe_charge_double = double(:paid? => true)
			expect(Stripe::Charge).to receive(:create).once.with({
				card: @subscription.user.card_token,
				amount: 500,
				currency: 'cad'
				}).and_return(stripe_charge_double)
			@sc.charge!
		end

		it "should set the next_payment_date to next month" do
			stripe_charge_double = double(:paid? => true)
			next_payment_date = @subscription.next_payment_date
			expect(Stripe::Charge).to receive(:create).once.with({
				card: @subscription.user.card_token,
				amount: 500,
				currency: 'cad'
				}).and_return(stripe_charge_double)
			@sc.charge!
			expect(@subscription.next_payment_date).to eq(next_payment_date.advance(months: 1))
		end

		it "should set the last_payment_date to today" do
			stripe_charge_double = double(:paid? => true)
			expect(Stripe::Charge).to receive(:create).once.with({
				card: @subscription.user.card_token,
				amount: 500,
				currency: 'cad'
				}).and_return(stripe_charge_double)
			@sc.charge!
			expect(@subscription.last_payment_date.to_date).to eq(Date.today)
		end

		it "should create a payment, if successful" do
			stripe_charge_double = double(:paid? => true)
			expect(Stripe::Charge).to receive(:create).once.with({
				card: @subscription.user.card_token,
				amount: 500,
				currency: 'cad'
				}).and_return(stripe_charge_double)
			@sc.charge!
			expect(@subscription.payments.count).to eq(1)
		end
	end

	context "#charge! failure" do
		it "should return a stripe error" do
			expect(Stripe::Charge).to receive(:create).once.with({
				card: @subscription.user.card_token,
				amount: 500,
				currency: 'cad'
				}).and_raise(Stripe::CardError.new("","",""))
			@sc.charge!
			expect(@subscription.payments.count).to eq(0)
		end
	end
	
end