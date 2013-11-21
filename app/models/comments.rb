class Comments < ActiveRecord::Base
  belongs_to :dish :user
end
