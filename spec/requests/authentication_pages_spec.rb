require 'spec_helper'

describe "Authentication" do

  subject { page }
  
  describe "Home Page" do
    
    describe "for unauthenticated hub" do
      before { visit root_path }
      it { should have_link('Sign in ') }
    end
    
    describe "for authenticated hub" do
      let(:hub) { FactoryGirl.create(:hub) }

      before do
       signin(:hub)
       visit root_path
      end
      
      it { should have_link ('Sign out') }
    end
    
  end

end
