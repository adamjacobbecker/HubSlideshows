require 'spec_helper'

describe "hubs/show" do
  before(:each) do
    @hub = assign(:hub, stub_model(Hub))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
