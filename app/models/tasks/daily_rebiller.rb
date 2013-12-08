class Tasks::DailyRebiller
	def run
		Subscription.requires_rebill.find_each(batch_size: 500) do |s|
			payment = SubscriptionCharge.new(s).charge!
		end
	end
end