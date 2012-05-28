require 'spec_helper'

describe Project do

  before do
    @hub = FactoryGirl.create(:hub)
    @project = @hub.projects.new(name: "GovHub", email: "contact@govhub.org")
  end
  
  subject { @project }
  
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :hub }
  
  it { should_not be_accessible(:hub_id) }
  
  it { should be_valid }
  
  describe "on saving, it should create a key" do
    before { @project.save }
    its(:key) { should_not be_blank }
    
    describe "on saving again, the key should not change" do
      let(:old_key) { @project.key }
      before { @project.update_attributes!(name: "Hub of Gov") }
      its(:key) { should == old_key }
    end
    
  end

end
