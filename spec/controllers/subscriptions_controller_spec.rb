require 'spec_helper'

describe SubscriptionsController do
	context "subscriptions#new" do
		before :each do
			allow_any_instance_of(Subscription).to receive(:start_subscription)
			allow(Stripe::Charge).to receive(:create).and_return(true)
			@user = FactoryGirl.create :user
			session[:user_id] = @user.id
		end

		it "should create a new subscription" do
			get 'new'
			expect(assigns[:subscription]).to be_a_new(Subscription)
		end

		it "should receive an http success" do
			get 'new'
			expect(response).to be_success
		end

		it "should be able to successfully sign-in"
	end

	context "subscriptions#create" do
		before :each do
			allow_any_instance_of(Subscription).to receive(:start_subscription)
			@user = FactoryGirl.create :user
			session[:user_id] = @user.id
		end

		it "should capture the token of the current user" do
			post 'create', token: "12345"
			@user.reload
			expect(@user.stripe_customer_token).to eq("12345")
		end

		it "should create a subscription for the current user" do
			post 'create'
			expect(Subscription.all.count).to eq(1)
		end

		it "should render new on failure to save the subscription" do
			post 'create'
			#@subscription = FactoryGirl.build :subscription, start_date: nil 
			Subscription.any_instance.stub(:save).and_return(false)
			expect(response).to render_template('new')
		end

	end
end
