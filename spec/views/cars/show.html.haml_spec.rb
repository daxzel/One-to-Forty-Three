require 'spec_helper'

describe "cars/show.html.haml" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :title => "Title",
      :wiki => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
