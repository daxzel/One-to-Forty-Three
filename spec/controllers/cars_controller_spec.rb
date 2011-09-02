require 'spec_helper'

describe CarsController do

  include Devise::TestHelpers

  def valid_attributes
    FactoryGirl.attributes_for :car
  end

  describe "GET show" do
    it "assigns the requested car as @car" do
      car = Car.create! valid_attributes
      get :show, :id => car.to_param.to_s
      assigns(:car).should eq(car)
    end
  end


  describe "GET new" do
    it "assigns a new car as @car" do
      get :new
      assigns(:car).should be_a_new(Car)
    end
  end

  describe "GET edit" do
    it "assigns the requested car as @car" do
      car = Car.create! valid_attributes
      get :edit, :id => car.to_param.to_s
      assigns(:car).should eq(car)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Car" do
        expect {
          post :create, :car => valid_attributes
        }.to change(Car, :count).by(1)
      end

      it "assigns a newly created car as @car" do
        post :create, :car => valid_attributes
        assigns(:car).should be_a(Car)
        assigns(:car).should be_persisted
      end


      it "redirects to the created car" do
        post :create, :car => valid_attributes
        response.should redirect_to(Car.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved car as @car" do
        Car.any_instance.stub(:save).and_return(false)
        post :create, :car => {}
        assigns(:car).should be_a_new(Car)
      end
      next

      it "re-renders the 'new' template" do
        Car.any_instance.stub(:save).and_return(false)
        post :create, :car => {}
        response.should render_template("new")
      end
    end
  end
  describe "bud spec" do
    next
    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested car" do
          car = Car.create! valid_attributes
          Car.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => car.to_param, :car => {'these' => 'params'}
        end

        it "assigns the requested car as @car" do
          car = Car.create! valid_attributes
          put :update, :id => car.to_param, :car => valid_attributes
          assigns(:car).should eq(car)
        end

        it "redirects to the car" do
          car = Car.create! valid_attributes
          put :update, :id => car.to_param, :car => valid_attributes
          response.should redirect_to(car)
        end
      end

      describe "with invalid params" do
        it "assigns the car as @car" do
          car = Car.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Car.any_instance.stub(:save).and_return(false)
          put :update, :id => car.to_param, :car => {}
          assigns(:car).should eq(car)
        end

        it "re-renders the 'edit' template" do
          car = Car.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Car.any_instance.stub(:save).and_return(false)
          put :update, :id => car.to_param.to_s, :car => {}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested car" do
        car = Car.create! valid_attributes
        expect {
          delete :destroy, :id => car.to_param.to_s
        }.to change(Car, :count).by(-1)
      end

      it "redirects to the cars list" do
        car = Car.create! valid_attributes
        delete :destroy, :id => car.to_param.to_s
        response.should redirect_to(cars_url)
      end
    end

  end

  describe "GET index" do

    describe "with 1 car" do
      it "should have only 3 car for the bigger number of tt " do
        @car=FactoryGirl.create :car
        get 'index' 
        response.should be_success
        assigns(:cars).should have(1).item
      end
    end

    describe "with 10 cars" do

      before :each do
        10.times { FactoryGirl.create :car }
      end

      it "should have only 3 car for the bigger number of the cars" do
        50.times do
          get "index"
          assigns(:cars).should have(Settings.count_cars_in_page).items
        end
      end
    end
  end

  describe "subscription" do
    before :each do
      @user = FactoryGirl.create :user
      @car = FactoryGirl.create :car 
      sign_in @user
    end

    it "should subscribe to a car" do
      @car.users.should be_empty
      post "subscribe_user", :id => @car.to_param
      response.should be_redirect
      @car.reload
      @car.users.should have(1).item
      @car.users.should include(@user)
      flash[:error].should be_blank
    end
  end

  describe "subscription for unsigned users" do
    before(:each){ @car = FactoryGirl.create :car }
    
    it "should display error flash if we are not lgged in " do
      post "subscribe_user", :id => @car.to_param
      response.should be_redirect
      flash[:error].should be_present
    end

  end

end
