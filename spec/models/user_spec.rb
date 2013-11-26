require 'spec_helper'

describe User do

  describe "fullname" do 

    it "returns the user's full name" do 
      user = User.new(firstname: 'Ghostface', lastname: 'Killah')
      expect(user.full_name).to eq("Ghostface Killah")
    end
  
  	it "returns just the firstname if lastname is not there" do
  		user = User.new(firstname: 'Method')
  		expect(user.full_name).to eq('Method')
  	end

  	it "returns just the lastname if firstname is not there" do
  		user = User.new(lastname: 'Deck')
  		expect(user.full_name).to eq('Deck')
  	end

  end

  describe "registration" do

  	it "should fail without a password" do
  		user = User.new(
  			firstname: "Inspectah",
  			lastname: "Deck",
  			email: "inspectah.deck@gmail.com")
  		expect(user.save).to eq(false)
  		expect(user.errors[:password].first).to eq("can't be blank")
  	end
  
  	it "should fail without password confirmation" do
  		user = User.new(
  			firstname: "U",
  			lastname: "God",
  			email: "u.god@gmail.com")
  		user.password = 'ugodpassword'
  		user.save
  		expect(user.errors[:password_confirmation].first).to eq("can't be blank")
  	end

  	it "should work with password and password confirmation" do 
      user = User.new(
        firstname: "Ol Dirty", 
        lastname: "Bastard", 
        email: "ol.dirty.bastard@gmail.com"
      )
      user.password = 'dirtydog'
      user.password_confirmation = 'dirtydog'
      expect(user.save).to eq(true)
      expect(User.count).to eq(1) # not really needed but we are a cautious bunch
    end

    it "should not work if password and password confirmation don't match" do
    	user = User.new(
    		firstname: "Masta",
    		lastname: "Killa",
    		email: "masta.killa@gmail.com")
    	user.password = 'mastakilla'
    	user.password_confirmation = 'mastahkilla'
    	expect(user.save).to eq(false)
    	expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
    end

    it "should not work if email is already taken by another user" do
    	user = User.new(
    		firstname: "Masta",
    		lastname: "Killa",
    		email: "masta.killa@gmail.com")
    	
    end

  end

    pending "should not work if email is already taken by another user"
    pending "should not work for passwords less than 6 characters"
    pending "should not work for passwords more than 20 characters"
    pending "should not work if email provided not a valid email address"
end
