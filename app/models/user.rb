class User < ActiveRecord::Base
	has_many :dishes 
	has_many :comments

	has_secure_password

	validates :email,
		presence: true

	validates :first_name,
		presence: true

	validates :last_name,
		presence: true

	validates :password,
		length: { in: 6..20 }, on: :create

	def full_name
		"#{firstname} #{lastname}"
	end

end
