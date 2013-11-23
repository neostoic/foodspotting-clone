class Dish < ActiveRecord::Base
	belongs_to :user
	has_many :likes

	mount_uploader :image, DishUploader 

	validates :title,
		presence: true

	validates :city,
		presence: true

	validates :description,
		presence: true
end
