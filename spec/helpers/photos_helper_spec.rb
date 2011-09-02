require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PhotoHelper. For example:
#
# describe PhotoHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end

describe PhotosHelper do

  pending "should render gallery" do
    photo = Factory.create(:photo)
    photo.photo.should_receive(:url).with(:large).and_return("large")

    result = %(
      <div class="picture">
          <div class="photo">
              <a class="gallery_fancy" href="large"><img src="small" alt="alt"></a>
          </div>
          <div class="deliting">
              <a href="/cabinet/photos?id=4&amp;method=delete"><img src="/images/close.png?1314770932" alt="Close"></a>
          </div>
      </div>
    ).gsub(/\s/, "")
    
    gallery_photo(photo).gsub(/\s/, "").should == result
  end
end
