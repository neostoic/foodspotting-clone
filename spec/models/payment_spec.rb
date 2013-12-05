require 'spec_helper'

describe Payment do

	before :each do 
    @payment = FactoryGirl.build :payment
  end

	context "associations" do
		it "belong to a subscription" do
			@payment.subscription = nil
			expect(@payment.save).to eq(false)
		end
	end

	context "validations" do
		it "should validate the presence of subscription" do
			@payment.amount = nil
			expect(@payment.save).to eq(false)
		end
		it "should validate the presence of paid_date" do
			@payment.paid_date = nil
			expect(@payment.save).to eq(false)
		end
	end
	
end