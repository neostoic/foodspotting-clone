# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do |subscription|
  	user
  	start_date DateTime.current
  	end_date DateTime.current.advance(months: 1)
  	status "active"
  	last_payment_date DateTime.current.advance(months: -1)
  	num_failures 0
  end
end
