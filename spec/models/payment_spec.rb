require 'spec_helper'

describe Payment do

	before :each do 
		allow_any_instance_of(Subscription).to receive(:start_subscription)
    @payment = FactoryGirl.build :payment
  end

	context "validations" do
		it "should validate the presence of amount" do
			@payment.amount = nil
			expect(@payment.save).to eq(false)
		end
		it "should validate if amount is not an integer" do
      @payment.amount = "amount"
      expect(@payment).to_not be_valid
      expect(@payment.errors[:amount].first).to eq("is not a number")
    end
		it "should validate the presence of paid_date" do
			@payment.paid_date = nil
			expect(@payment.save).to eq(false)
		end
		it "should validate the prsence of subscription" do
			@payment.subscription = nil
      expect(@payment).to_not be_valid
      expect(@payment.errors[:subscription].first).to eq("can't be blank")
		end
	end
	
end