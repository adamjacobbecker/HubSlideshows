require 'spec_helper'

describe "hubs/edit" do
  before(:each) do
    @hub = assign(:hub, stub_model(Hub))
  end

  it "renders the edit hub form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hubs_path(@hub), :method => "post" do
    end
  end
end
