require 'spec_helper'

describe "Photos" do

  next 

  describe "GET /index" do
    it "Should render gallery correctly" do
      visit photos_path
      page.should have_content(I18n.t("all_photos"))
      page.should have_content(I18n.t("upload_photos"))
    end
  end
  
end

