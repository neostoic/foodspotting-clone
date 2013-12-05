require 'spec_helper'

describe SubscriptionCharge do
		before :each do 
    	@subscription = FactoryGirl.create :subscription
    	@sc = SubscriptionCharge.new(@subscription)
  	end
		
		context "#charge!" do
			it "should attempt to create a new charge through Stripe" do
				# setup a instance of a SC
				# set an expectation that when #charge! is called on the instance, it will make a call to Stripe with certain params
				# execute the charge! so that the above expectation can be checked

				stripe_charge_double = double(:paid? => true)
				expect(Stripe::Charge).to receive(:create).once.with({
					card: @subscription.user.card_token,
					amount: 500,
					currency: 'cad'
					}).and_return(stripe_charge_double)
				@sc.charge!
			end

		# it "should successfully create a charge" do
		# 	@payment.charge!
		# 	expect(customer_charge.response.paid).eq (true)
		# end

		# it "should successfully deny a charge" do
		# end
	end
	
end