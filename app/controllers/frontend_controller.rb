class FrontendController < ApplicationController
  
  before_filter :correct_key, only: [:edit, :update_project_from_json]
  
  def new
    @project = Project.new
    render :layout => 'frontend'
  end
  
  def edit
    render :layout => 'frontend'
  end
  
  def new_project_from_json
    @project = Project.new
    save_project_json
  end
  
  def update_project_from_json
    save_project_json
  end
  
  def create_asset
    uploader = FileUploader.new
    begin
      uploader.store!(params[:upload_form][:uploaded_data])
      render :json => { asset_url: uploader.url }
    rescue CarrierWave::IntegrityError
      render :json => { error: 'Error!' }
    end
  
  end
  
  private
  
    def correct_key
      @project = Project.find(params[:id])
      redirect_to root_path unless @project.key == params[:key]
    end
  
    def save_project_json
      
      project = ActiveSupport::JSON.decode(params["project"])

      @project.hub_id = project["hub_id"].to_i
      @project.name = project["name"]
      @project.email = project["email"]
      @project.logo = project["logo"]
      @project.misc_image = project["misc_image"]

      if @project.save
        
        @project.pages.delete_all

        project["slides"].each do |page|

          @page = @project.pages.build
          @page[:page_type] = page["page_type"]

          @page.content = page["content"]

          @page.save

        end

        render :json => { id: @project.id, edit_project_path: edit_project_url(@project.id, @project.key) }

      else
        render :json => { errors: @project.errors.each {|x| x} }
      end
      
    end
  
end