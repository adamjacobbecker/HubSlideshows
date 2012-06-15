require 'spec_helper'

describe "hubs/new" do
  before(:each) do
    assign(:hub, stub_model(Hub).as_new_record)
  end

  it "renders new hub form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hubs_path, :method => "post" do
    end
  end
end
