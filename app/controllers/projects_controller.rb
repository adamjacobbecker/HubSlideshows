class ProjectsController < ApplicationController
  
  before_filter :correct_hub
  
  def edit
    @all_hubs = Hub.all
  end
  
  def update
    @project.update_attributes(params[:project])
    @project.hub_id = params[:hub]
    @project.save
    redirect_to edit_project_path(@project), flash: { success: "Project updated!" }
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end
  
  private
  
    def correct_hub
      if signed_in?
        @project = current_hub.projects.find_by_id(params[:id])   
      end     
      redirect_to root_path if @project.nil?
    end
  
end
