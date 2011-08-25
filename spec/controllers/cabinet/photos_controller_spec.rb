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

end
