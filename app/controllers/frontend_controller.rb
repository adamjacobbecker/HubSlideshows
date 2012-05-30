class FrontendController < ApplicationController
  def new
    @project = Project.new
    
    render :layout => 'frontend'
  end
end