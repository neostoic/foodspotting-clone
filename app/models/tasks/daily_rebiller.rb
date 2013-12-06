class Tasks::DailyRebiller
	def run
		find_subscriptions_for_billing.find_each(batch_size: 500) do |s|
			payment = SubscriptionCharge.new(s).charge!
		end
	end
	def find_subscriptions_for_billing
		Subscription.where("last_payment_date <= ?", one_month_ago)
	end
	def one_month_ago
		Date.today.advance(month: -1)
	end
end