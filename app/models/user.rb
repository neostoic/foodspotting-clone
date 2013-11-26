class User < ActiveRecord::Base

	include Gravtastic
	has_gravatar

	has_many :dishes 
	has_many :likes

	has_secure_password

	validates :email, uniqueness: true,
		presence: true

	validates :first_name,
		presence: true

	validates :last_name,
		presence: true

	validates :password,
		length: { in: 6..20 }, on: :create

	def full_name
		"#{first_name} #{last_name}".strip
	end

end
