require 'spec_helper'

describe ProjectsController do

  let(:hub) { FactoryGirl.create(:hub) }
  let(:other_hub) { FactoryGirl.create(:hub) }
    
  describe "deleting a project" do
    
    describe "when not using key" do
      
      describe "when signed in" do
      
        before do 
          @project = FactoryGirl.create(:project, hub: hub)
          signin(hub)
        end
      
        it "should delete a project" do
          expect do
            delete :destroy, id: @project.id
          end.should change(Project, :count).by(-1)
        end
      
      end
      
      describe "when not signed in" do
      
        before do 
          @project = FactoryGirl.create(:project, hub: hub)
        end
      
        it "should not delete a project" do
          expect do
            delete :destroy, id: @project.id
          end.should_not change(Project, :count)
        end
      
      end
      
    end

  end

end