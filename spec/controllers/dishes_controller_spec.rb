require 'spec_helper'

describe DishesController do
	render_views

	describe "GET 'dishes#index'" do
		it "returns http success" do
			get :index
			expect(response).to be_success
			expect(response.body).to render_template('index')
		end
	end


	describe "GET 'dishes#show'" do
		it "renders an existing dish" do
			dish = FactoryGirl.create :dish
			session[:user_id] = dish.user.id
			get :show, id: dish.id
			expect(response).to be_success
			expect(response).to render_template('show')
		end
	end

	describe "POST 'dishes#create" do
		it "creates a POST request for a new dish" do
			dish = FactoryGirl.build :dish
			params = { dish: {title: dish.title, city: dish.city, description: dish.description, image: dish.image} }
			session[:user_id] = dish.user.id
			post :create, params
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

	describe "GET 'dishes#edit'" do
		it "creates a GET request for dish to edit" do
			dish = FactoryGirl.create :dish
			params = { id: dish.id }
			session[:user_id] = dish.user.id
			get :edit, params
			expect(response).to be_success
		end
	end

end
