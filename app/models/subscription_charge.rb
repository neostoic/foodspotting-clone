class SubscriptionCharge	
	def initialize(subscription)
		@subscription = subscription
	end

	def charge!
		#TODO store api_key somewhere safe
		Stripe.api_key = "sk_test_z5TEngEiDxsQ1CQV1BX685MS"

		customer_charge = Stripe::Charge.create(
	  	card: @subscription.user.card_token,
	  	amount: 500,
	  	currency: "cad"
		)

		# if customer_charge.paid?
		# 	@subscription.paid_date = Date.today
		# 	p = @subscription.payments.create(amount)
		# end
		#TODO ADD RESCUE
	end
end