FactoryGirl.define do

  factory :user do |user|
    first_name 'Method'
    last_name  'Man'
    sequence(:email) {|i| "method-#{i}@wu-tang.com" } 
    password 'm-e-t-h-o-d'
    password_confirmation 'm-e-t-h-o-d'
    card_token "card_10344H2kOEIz0oZZ7XS931pf"
    stripe_customer_token "cus_344GpXte6BltvH" #created via the Stripe website
        
	  factory :admin_user do
	    admin true
    end

    factory :restaurant_owner do
      restaurant_owner true
    end

  end
end
