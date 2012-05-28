class PagesController < ApplicationController
  
  before_filter :correct_hub
  
  def new
    @page = @project.pages.build
  end
  
  def create
    @page = @project.pages.build
    update_from_params(@page, params)
    @page.save
    redirect_to edit_project_path(@project)
  end
  
  def edit
    @page = @project.pages.find_by_id(params[:id])
  end
  
  def update
    @page = @project.pages.find_by_id(params[:id])
    update_from_params(@page, params)
    @page.save
    redirect_to edit_project_path(@project)
  end
  
  def destroy
    @page = @project.pages.find_by_id(params[:id])
    @page.destroy
    redirect_to edit_project_path(@project)
  end
  
  private
  
    def update_from_params(page, params)
      
      page.page_type = params[:page_type]

      case params[:page_type]
      when 'Big Text'
        page.content = params[:big_text]
      when 'Big Photo'
        page.content = params[:big_photo]
      when 'Text and Photo'
        page.content = params[:text_and_photo]
      when 'Team Bios'
        page.content = params[:team_bios]
      when 'Contact Info'
        page.content = params[:contact_info]
      end
      
    end
  
    def correct_hub
      @project = Project.find(params[:project_id])
      if !signed_in? || @project.hub_id != current_hub.id
        redirect_to root_path
      end     
    end
  
end
