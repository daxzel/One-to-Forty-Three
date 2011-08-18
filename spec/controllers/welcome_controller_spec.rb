require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have 1 car for the few number of car" do
      @car=FactoryGirl.create :car
      get 'index'
      response.should be_success
      assigns(:cars).should have(1).item
    end
   
    describe "with 10 cars" do
      before :each do
        10.times { FactoryGirl.create :car }
      end

      next

      it "should have only 3 car for the bigger number of the cars" do
        50.times do
          get "index"
          assigns(:cars).should have(4).items
        end
      end
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end


end
