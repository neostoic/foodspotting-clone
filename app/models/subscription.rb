class Subscription < ActiveRecord::Base
	belongs_to :user

	validates :user,
		presence: true,
		uniqueness: true
	
	validates :start_date,
		presence: true
	
	validates :end_date,
		presence: true
	
	validates :status,
		presence: true
end
