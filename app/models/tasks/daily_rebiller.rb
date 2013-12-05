class Tasks::DailyRebiller
	def run
		today = Date.today
		one_month_ago = today.advance(month: -1)
		Subscription.where("last_payment_date <= ?", one_month_ago).find_each(batch_size: 500) do |s|
			payment = SubscriptionCharge.new(s).charge!
		end
	end
end