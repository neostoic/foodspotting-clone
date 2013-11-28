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

	describe "GET 'dishes#edit'" do
		it "creates a GET request for dish to edit" do
			dish = FactoryGirl.create :dish
			session[:user_id] = dish.user.id
			get :edit, id: dish.id
			expect(response).to be_success
		end
	end

	describe "PATCH 'dishes#update'" do
		it "creates a PATCH request for a dish" do
			dish = FactoryGirl.create :dish
			session[:user_id] = dish.user.id
			put :update, id: dish.id, dish: FactoryGirl.attributes_for(:dish)
			expect(response).to redirect_to( dish_path(dish.id) )
		end

		it "fails to update the page" do
			dish = FactoryGirl.create :dish
			session[:user_id] = dish.user.id
			updated_dish = FactoryGirl.attributes_for(:dish)
			put :update, id: dish.id, dish: {title: ''}
			expect(response).to render_template('edit')
		end
	end

	describe "DELETE 'dishes#destroy" do
		it "deletes a dish" do
			dish = FactoryGirl.create :dish
			session[:user_id] = dish.user.id
			delete :destroy, id: dish.id, dish: FactoryGirl.attributes_for(:dish)
			expect(response.status).to equal(302) 
		end
	end

end
