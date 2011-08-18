require 'spec_helper'

describe "cars/new.html.haml" do
  before(:each) do
    assign(:car, stub_model(Car,
      :title => "MyString",
      :wiki => "MyText"
    ).as_new_record)
  end

  it "renders new car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cars_path, :method => "post" do
      assert_select "input#car_title", :name => "car[title]"
      assert_select "textarea#car_wiki", :name => "car[wiki]"
    end
  end
end
