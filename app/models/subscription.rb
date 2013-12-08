class Subscription < ActiveRecord::Base
	belongs_to :user
	has_many :payments
	before_create :start_subscription

	scope :requires_rebill, -> { where("last_payment_date <= ?", DateTime.current.advance(months: -1))}

	validates :user,
		presence: true
	
	validates :start_date,
		presence: true

	default_value_for :start_date do
		DateTime.now
	end

	default_value_for :next_payment_date do
		DateTime.now
	end

	protected
	def start_subscription
		p = SubscriptionCharge.new(self).charge!
		if p

		else
			errors.add :base, "Failed payment"
			return false
		end
	end

end
