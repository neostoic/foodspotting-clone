require 'spec_helper'

describe Subscription do

	before :each do 
    @subscription = FactoryGirl.build :subscription
  end

	context "validations" do
		it "should validate the presence of user_id" do
			@subscription.user = nil
			expect(@subscription).to_not be_valid
			expect(@subscription.errors[:user].first).to eq("can't be blank")
		end
		it "should validate the presence of start_date" do
			@subscription.start_date = nil
			expect(@subscription.save).to eq(false)
		end
	end

	context "methods" do
		pending "#cancel should update the end_date to the subscription"
		pending "#charge should update the last_payment_date of the subscription"
		pending "#charge should reset num_failures (if any)"

	end
	
end