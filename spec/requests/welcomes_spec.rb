require 'spec_helper'

describe "Welcomes" do


  next 

  describe "GET /welcomes" do
    it "Should render main page" do
      visit root_path
      page.should have_content(I18n.translate("all_photos"))
    end
  end

  describe "About" do
    it "should have about keyword" do
      visit about_path
      page.should have_content("about")
    end
  end
end
