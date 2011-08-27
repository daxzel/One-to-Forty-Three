require 'spec_helper'

describe PhotosController do

  describe "GET 'index'" do
    it "should be successful" do
      
      audi = Factory.create :car

      get 'index', :car_id => audi.title
      response.should be_success
    end
    it "get car's photo" do
      
      audi = Factory.create :car

      car_photo = Factory.create(:photo, :car => audi)
      get 'index', :car_id => audi.title
      assigns(:photos).should have(1).items
      assigns(:photos).should include(car_photo)
    end
    it "Not get photo other car" do
      audi = Factory.create :car
      bmw = Factory.create :car
      
      car_audi_photo = Factory.create(:photo, :car => audi)
      car_bmw_photo = Factory.create(:photo, :car => bmw)
      get 'index', :car_id => audi.title
      assigns(:photos).should_not include(car_bmw_photo)
      response.should be_success
    end
  end
    
  describe "GET show" do
    it "do not show a photo other car" do
      audi = Factory.create :car
      bmw = Factory.create :car
      
      car_audi_photo = Factory.create(:photo, :car => audi)
      car_bmw_photo = Factory.create(:photo, :car => bmw)

      get :show, :car_id => audi.title, :id=>car_bmw_photo.id
      assigns(:photo).should eq(nil) 
    end

    it "show a photo our car" do
      audi = Factory.create :car
      bmw = Factory.create :car
      
      car_audi_photo = Factory.create(:photo, :car => audi)
      car_bmw_photo = Factory.create(:photo, :car => bmw)

      get :show, :car_id => audi.title, :id=>car_audi_photo.id
      response.should be_success
      assigns(:photo).should eq(car_audi_photo) 
    end
  end

end
