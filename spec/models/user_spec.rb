require 'spec_helper'

describe User do

	before :each do 
    @user = FactoryGirl.build :user
  end


  context "with subscription" do
    pending "should have only one subscription"
  end

  describe "associations" do
    it "can have many dishes" do
      @user.save
      first_dish = FactoryGirl.create :dish, user: @user
      second_dish = FactoryGirl.build :dish, user: @user
      expect(second_dish.save).to eq(true)
    end
  end

  describe "full_name" do 

    it "returns the user's full name" do 
      expect(@user.full_name).to eq("Method Man")
    end
  
  	it "returns just the firstname if lastname is not there" do
  		@user.last_name = nil
  		expect(@user.full_name).to eq('Method')
  	end

  	it "returns just the lastname if firstname is not there" do
  		@user.first_name = nil
  		expect(@user.full_name).to eq('Man')
  	end

  end

  describe "registration" do

  	it "should fail without a password" do
  		@user = FactoryGirl.build :user, password: nil, password_confirmation: nil
      expect(@user.save).to eq(false)
      expect(@user.errors[:password].first).to eq("can't be blank")
  	end
  
  	it "should fail without password confirmation" do
  		@user.password_confirmation = nil
  		@user.save
  		expect(@user.errors[:password_confirmation].first).to eq("can't be blank")
  	end

  	it "should work with password and password confirmation" do 
      expect(@user.save).to eq(true)
      expect(User.count).to eq(1) # not really needed but we are a cautious bunch
    end

    it "should not work if password and password confirmation don't match" do
    	@user.password_confirmation = 'methodman'
    	expect(@user.save).to eq(false)
    	expect(@user.errors[:password_confirmation].first).to eq("doesn't match Password")
    end

    it "should not work if email is already taken by another user" do
    	@user.save
    	new_email = @user.email
    	user = FactoryGirl.build :user, email: new_email
    	expect(user.save).to eq(false)
    	expect(user.errors[:email][0]).to eq("has already been taken")
    end

    it "should not work for passwords less than 6 characters" do
    	@user.password = '12345'
    	@user.password_confirmation = '12345'
    	@user.save
    	expect(@user.save).to eq(false)
    	expect(@user.errors[:password].first).to eq("is too short (minimum is 6 characters)")
    end

    it "should not work for passwords less than 6 characters" do
    	@user.password = '123456789101112131415161718192021'
    	@user.password_confirmation = '123456789101112131415161718192021'
    	@user.save
    	expect(@user.save).to eq(false)
    	expect(@user.errors[:password].first).to eq("is too long (maximum is 20 characters)")
    end

  end
    # test once email validation email is added
    pending "should not work if email provided not a valid email address"
end
