require 'spec_helper'

feature "Restaurant field" do

		before :each do
			visit dishes_path
			@user = FactoryGirl.create :restaurant_owner, email: 'inspektah-deck@gmail.com'
			fill_in 'email', with: @user.email
			fill_in 'password', with: @user.password
			click_button 'Log In'
		end
		
		scenario "for a logged in user" do
			page.should have_link 'Restaurant Dashboard'
		end

		context "while logged in" do

			scenario "restaurant user should click the Restaurant Dashboard button and be redirected to the appropriate page" do
				click_link 'Restaurant Dashboard'
				#page.should restaurant_owner_dishes_path
			end

		end
end