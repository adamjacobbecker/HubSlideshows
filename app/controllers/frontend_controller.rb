class FrontendController < ApplicationController
  def new
    @project = Project.new
    render :layout => 'frontend'
  end
  
  def edit
    @project = Project.find(params[:id])
    render :layout => 'frontend'
  end
  
  def new_project_from_json
    @project = Project.new
    save_project_json
  end
  
  def update_project_from_json
    @project = Project.find(params[:id])
    save_project_json
  end
  
  def create_asset
    name = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join) + ".jpg"
    directory = "public/images/upload"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:upload_form][:uploaded_data].read) }
    render :text => name
  end
  
  private
  
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

        render :text => @project.id

      else
        render :text => @project.errors.each {|x| x}
      end
      
    end
  
end