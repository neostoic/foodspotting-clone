# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do |payment|
  	subscription
    amount 500
    paid_date DateTime.now
  end
end
