require 'spec_helper'

describe Dish do
  it "record should fail without the title field populated" do
  	@dish = FactoryGirl.build :dish, restaurant: nil
  	expect(@dish).to_not be_valid
  end

  it "record should fail without the title field populated" do
  	@dish = FactoryGirl.build :dish
  	expect(@dish).to be_valid
  end
end
