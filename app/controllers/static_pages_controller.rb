class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @projects = current_hub.projects.all
    end
  end
  
  def play
    @hub = Hub.find(params[:hub_id])
    @x = @y = @page_count = @project_count = 1
    render :layout => false
  end
  
  def play_static
    render :layout => false
  end
end