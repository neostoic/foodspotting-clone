require 'spec_helper'

describe Subscription do

	context "associations" do
		it "should have one user" do
			
		end
		
		it "should have many payments" do
		end
	end

	context "validations" do
		it "should validate the presence of user_id" do

		end
		it "should validate the presence of start_date" do

		end
		it "should validate the presence of end_date" do

		end
		it "should validate the presence of status" do

		end
	end

	context "methods" do
		pending "#cancel should update the end_date to the subscription"
		pending "#charge should update the last_payment_date of the subscription"
		pending "#charge should reset num_failures (if any)"

	end
	
end