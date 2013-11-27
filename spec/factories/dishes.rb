# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dish do
  	user
  	title 			'Ramen'
  	city  			'Vancouver'
  	description 'Kintaro Ramen'
  	image				'/path/to/test_url'
  end
end
