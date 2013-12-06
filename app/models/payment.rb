class Payment < ActiveRecord::Base
	belongs_to :subscription

	validates :amount,
		presence: true

	validates :paid_date,
		presence: true

	after_create :set_paid_date
	after_create 	:send_receipt_email

	protected
	
	def set_paid_date
		binding.pry
		self.paid_date = Date.today
	end

	def send_receipt_email
		#TODO send email
	end

end
