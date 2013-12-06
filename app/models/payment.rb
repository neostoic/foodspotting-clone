class Payment < ActiveRecord::Base
	belongs_to :subscription

	validates :amount, numericality: { only_integer: true },
		presence: true

	validates :paid_date,
		presence: true

	validates :subscription,
		presence: true

	after_create 	:send_receipt_email

	protected

	def send_receipt_email
		#TODO send email
	end

end
