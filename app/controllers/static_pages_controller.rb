class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @projects = current_hub.projects.all
    end
  end
end