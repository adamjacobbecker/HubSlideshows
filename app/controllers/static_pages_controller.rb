class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @projects = current_hub.projects.all
    end
  end
  
  def play
    @hub = Hub.find(params[:hub_id])
    render :layout => false
  end
end