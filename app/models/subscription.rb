class Subscription < ActiveRecord::Base
	belongs_to :user
	has_many :payments

	validates :user,
		presence: true,
		uniqueness: true
	
	validates :start_date,
		presence: true
	
	validates :end_date,
		presence: true
	
	validates :status,
		presence: true

	default_value_for :start_date do
		DateTime.now
	end

	default_value_for :next_payment_date do
		DateTime.now
	end

end
