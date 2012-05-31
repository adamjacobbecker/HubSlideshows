class FrontendController < ApplicationController
  def new
    @project = Project.new
    
    render :layout => 'frontend'
  end
  
  def project_from_json
    
    @project = Project.new
    
    project = params["project"]
    
    @project.hub_id = project["hub_id"].to_i
    @project.name = project["name"]
    @project.email = project["email"]
    @project.logo = project["logo"]
    @project.misc_image = project["misc_image"]
    
    if @project.save
      
      ActiveSupport::JSON.decode(project["slides"]).each do |page|
        
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