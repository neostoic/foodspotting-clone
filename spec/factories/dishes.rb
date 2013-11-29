# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dish do
  	user
  	title 			'Ramen'
  	city  			'Vancouver'
  	description 'Tsukamen style'
  	image				'/path/to/test_url'
  	restaurant	'Kintaro Ramen'
  end
end
