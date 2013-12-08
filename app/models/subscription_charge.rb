class SubscriptionCharge	
	SUBSCRIPTION_AMOUNT = 500
	CURRENCY = "cad"

	def initialize(subscription)
		@subscription = subscription
	end

	def charge!
		#TODO store api_key somewhere safe
		Stripe.api_key = "sk_test_z5TEngEiDxsQ1CQV1BX685MS"

		begin
			customer_charge = Stripe::Charge.create(
		  	user: @subscription.user.stripe_customer_token,
		  	amount: SUBSCRIPTION_AMOUNT,
		  	currency: CURRENCY
			)

			if customer_charge.paid?
			 	@subscription.next_payment_date = @subscription.next_payment_date.advance(months: 1)
				@subscription.last_payment_date = Date.today
				#if @subscription.save
			 		@subscription.payments.create(amount: SUBSCRIPTION_AMOUNT, paid_date: Date.today)
			 	#end
			end

			rescue Stripe::CardError => e
		end

	end
end