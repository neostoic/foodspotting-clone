require 'spec_helper'

describe Dish do
  it "record should fail without all fields populated" do
  	@dish = FactoryGirl.build :dish, restaurant: nil
  	expect(@dish).to_not be_valid
  end
end
