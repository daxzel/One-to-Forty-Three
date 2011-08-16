require 'spec_helper'

describe PhotoController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "GET 'upload'" do
    it "should be successful" do
      get 'upload'
      response.should be_success
    end
  end

end
