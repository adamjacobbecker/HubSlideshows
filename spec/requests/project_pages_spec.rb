require 'spec_helper'

describe "Project Pages" do
  
  subject { page }
  let(:hub) { FactoryGirl.create(:hub) }
  
  before do
    signin(hub)
    @project = FactoryGirl.create(:project, hub: hub)
    visit root_path
  end

  describe "Deleting a project" do
      
      it "should delete the project" do
        expect { click_link "delete" }.should change(Project, :count).by(-1)
      end

  end

  describe "Editing a project" do
    
    before do
      signin(hub)
      visit edit_project_path(@project)
    end
    
    describe "with valid info" do
      let(:new_name) { "Newname" }
  
      before do
        fill_in "Name", with: new_name
        click_button "Save"
      end
  
      it { should have_selector('h1', text: "Editing #{new_name}") }
    end
    
  end

end
