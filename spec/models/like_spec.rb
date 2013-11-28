require 'spec_helper'

describe Like do

  before :each do
    @like = FactoryGirl.create :like
  end
  
  describe "Validations" do
  	it "should not allow a user to like the same dish twice" do
  		second_user = @like.user
  		second_dish = @like.dish
  		second_like = FactoryGirl.build :like, user: second_user, dish: second_dish
  		expect(second_like.save).to eq(false)
  		expect(second_like.errors[:user].first).to eq("has already been taken")
  	end

  	it "should allow a user to like multiple dishes" do
  		same_user = @like.user
  		second_like = FactoryGirl.build :like, user: same_user
  		expect(second_like.save).to eq(true)
  	end

  	it "should allow the same dish to be liked by multiple users" do
  		same_dish = @like.dish
  		second_like = FactoryGirl.build :like, dish: same_dish
  		expect(second_like.save).to eq(true)
  	end

  end
  
end
