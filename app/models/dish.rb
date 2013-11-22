class Dish < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :title,
		presence: true

	validates :city,
		presence: true

	validates :description,
		presence: true
end
