FactoryGirl.define do

  factory :user do
    first_name 'Method'
    last_name  'Man'
    sequence(:email) {|i| "method-#{i}@wu-tang.com" } 
    password 'm-e-t-h-o-d'
    password_confirmation 'm-e-t-h-o-d'
        
	  factory :admin_user do
	    admin true
    end
  end
end
