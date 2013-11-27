class Like < ActiveRecord::Base
  belongs_to :dish 
  belongs_to :user
  validates :user, uniqueness: { scope: :dish }
end
