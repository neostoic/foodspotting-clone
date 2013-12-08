require 'spec_helper'

describe DishesController do

	render_views

	context "dishes#index" do 
		context "search actions" do
			before :each do 
				@dish1 = FactoryGirl.create :dish, city: "Boston", restaurant: "Toro"
				@dish2 = FactoryGirl.create :dish, city: "Boston", restaurant: "The Franklin", user: @dish1.user
				@dish3 = FactoryGirl.create :dish, city: "Toronto", user: @dish1.user
			end

			it "find 2 entries when searching by city: Boston" do
				session[:user_id] = @dish1.user.id
				get :index, city: "Boston"
				assigns(:dishes).length.should be(2)
				#TODO refactor to pass object
				assigns(:dishes).first.city.should eq("Boston")
			end

			it "find 1 entry when searching by restaurant: Toro" do
				session[:user_id] = @dish1.user.id
				get :index, restaurant: "Toro"
				assigns(:dishes).length.should be(1)
				#TODO refactor to pass object
				assigns(:dishes).first.restaurant.should eq("Toro")
			end

		end
		
		describe "GET 'dishes#index'" do
			it "returns http success" do
				get :index
				expect(response).to be_success
				expect(response.body).to render_template('index')
			end
		end
	end

	describe "POST 'dishes#create" do
		it "creates a POST request for a new dish" do
			dish = FactoryGirl.build :dish
			session[:user_id] = dish.user.id
			post :create, dish: FactoryGirl.attributes_for(:dish)
			expect(response).to redirect_to(dishes_path)
		end
	end

	describe "GET 'dishes#new'" do
		it "creates a GET request for a new dish" do
			dish = FactoryGirl.build :dish
			session[:user_id] = dish.user.id
			get :new
			expect(response).to be_success
		end
	end

	context "requires dish creation to" do

		before :each do
			@dish = FactoryGirl.create :dish
			session[:user_id] = @dish.user.id
		end

		describe "GET 'dishes#show'" do
			it "renders an existing dish" do
				get :show, id: @dish.id
				expect(response).to be_success
				expect(response).to render_template('show')
			end
		end

		describe "GET 'dishes#edit'" do
			it "creates a GET request for dish to edit" do
				get :edit, id: @dish.id
				expect(response).to be_success
			end
		end

		describe "PATCH 'dishes#update'" do
			it "creates a PATCH request for a dish" do
				put :update, id: @dish.id, dish: FactoryGirl.attributes_for(:dish)
				expect(response).to redirect_to( dish_path(@dish.id) )
			end

			it "fails to update the page" do
				updated_dish = FactoryGirl.attributes_for(:dish)
				put :update, id: @dish.id, dish: {title: ''}
				expect(response).to render_template('edit')
			end
		end

		describe "DELETE 'dishes#destroy" do
			it "deletes a dish" do
				delete :destroy, id: @dish.id, dish: FactoryGirl.attributes_for(:dish)
				expect(response.status).to equal(302) 
			end
		end

	end


end
