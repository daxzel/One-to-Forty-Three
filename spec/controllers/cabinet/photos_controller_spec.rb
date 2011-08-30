require 'spec_helper'

describe Cabinet::PhotosController do
  include Devise::TestHelpers

  describe "GET 'index'" do
    it "should be successful" do
      ted = Factory.create :user
      sign_in ted

      joe = Factory.create :user

      our_photo = Factory.create(:photo, :user => ted)
      another_photo = Factory.create(:photo, :user => joe)

      get 'index'
      response.should be_success
      assigns(:photos).should include(our_photo)
      assigns(:photos).should_not include(another_photo)
    end
  end

  describe "GET show" do
    it "do not show a photo the copyright of another person" do
      ted = Factory.create :user
      sign_in ted

      joe = Factory.create :user

      another_photo = Factory.create(:photo, :user => joe)

      get :show, :id => another_photo.id
      assigns(:photo).should eq(nil) 
    end

    it "show a photo the copyright of another person" do
      ted = Factory.create :user
      sign_in ted

      joe = Factory.create :user

      our_photo = Factory.create(:photo, :user => ted)
      another_photo = Factory.create(:photo, :user => joe)

      get :show, :id => our_photo.id
      response.should be_success
      assigns(:photo).should eq(our_photo) 
    end
  end
  describe "Unfinished specs" do
    next
    describe "GET new" do
      it "assigns a new photo as @photo" do
        get :new
        assigns(:photo).should be_a_new(Photo)
      end
    end

    describe "POST create" do
      describe "with valid params" do

        it "assigns a newly created car as @car" do
          post :create, :photo => valid_attributes
          assigns(:photo).should be_a(Car)
          assigns(:car).should be_persisted
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
  end
end
