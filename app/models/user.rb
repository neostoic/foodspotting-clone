class User < ActiveRecord::Base
	has_many :dishes :comments
end
