class SubscriptionsController < ApplicationController
	def new
		@subscription = Subscription.new
	end

	def create
		current_user.stripe_customer_token = params[:token]
		current_user.save
		@subscription = current_user.create_subscription
		if (@subscription.save)
			redirect_to dishes_path
		else
			render :new
		end
	end
end
