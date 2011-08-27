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


end
