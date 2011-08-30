require 'spec_helper'

describe Cabinet::CarsController do

  describe "GET 'index'" do
    it "should be successful" do
      ted = Factory.create :user
      sign_in ted

      joe = Factory.create :user

      our_car = Factory.create(:car, :user => ted)
      ted.cars.add(our_car)
      another_car = Factory.create(:car, :user => joe)
      joe.cars.add(another_car)
      get 'index'
      response.should be_success
      assigns(:cars).should include(our_car)
      assigns(:cars).should_not include(another_car)
    end
  end

  describe "GET show" do
    it "do not show a photo the copyright of another person" do
      ted = Factory.create :user
      sign_in ted

      joe = Factory.create :user

      another_car = Factory.create(:car, :user => joe)
      joe.cars.add(another_car)
      get :show, :id => another_car.title 
      assigns(:car).should eq(nil) 
    end

    it "show a photo the copyright of another person" do
      ted = Factory.create :user
      sign_in ted

      joe = Factory.create :user

      our_car = Factory.create(:car, :user => ted)
      ted.cars.add(our_car)
      another_car = Factory.create(:car, :user => joe)
      joe.cars.add(another_car)

      get :show, :id => our_car.title
      response.should be_success
      assigns(:car).should eq(our_car) 
    end
  end
end
