class ProjectsController < ApplicationController
  
  before_filter :correct_hub
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end
  
  def toggle_approval
    @project = Project.find(params[:id])
    @project.toggle(:approved).save
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
