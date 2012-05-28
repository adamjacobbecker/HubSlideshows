require 'spec_helper'

describe "Static Pages" do
  
  subject { page }
  
  describe "layout" do
    
    let(:hub) { FactoryGirl.create(:hub) }
    before do
      signin(hub)
      visit root_path
    end
    
    it { should have_selector('a', text: hub.name) }
    
  end

end
