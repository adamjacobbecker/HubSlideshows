require 'spec_helper'

describe "hubs/index" do
  before(:each) do
    assign(:hubs, [
      stub_model(Hub),
      stub_model(Hub)
    ])
  end

  it "renders a list of hubs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
