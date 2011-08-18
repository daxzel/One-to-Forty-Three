require 'spec_helper'

describe "Photos" do
  describe "GET /index" do
    it "Should render gallery correctly" do
      visit photos_path
      page.should have_content(I18n.translate("all_photos"))
      page.should have_content(I18n.translate("upload_photos"))
    end
  end
  
end

