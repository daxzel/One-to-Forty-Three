require 'spec_helper'

describe "Welcomes" do
  describe "GET /welcomes" do
    it "Should render main page" do
      visit root_path
      page.should have_content("Популярные фотографии")
    end
  end
end
