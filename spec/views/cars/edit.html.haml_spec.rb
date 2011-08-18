require 'spec_helper'

describe "cars/edit.html.haml" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :title => "MyString",
      :wiki => "MyText"
    ))
  end

  it "renders the edit car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cars_path(@car), :method => "post" do
      assert_select "input#car_title", :name => "car[title]"
      assert_select "textarea#car_wiki", :name => "car[wiki]"
    end
  end
end
