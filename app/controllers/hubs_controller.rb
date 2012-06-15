class HubsController < ApplicationController

  def new
    @hub = Hub.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hub }
    end
  end

  # POST /hubs
  # POST /hubs.json
  def create
    @hub = Hub.new(params[:hub])

    respond_to do |format|
      if @hub.save
        format.html { redirect_to root_path, notice: 'Hub was successfully created.' }
        format.json { render json: @hub, status: :created, location: @hub }
      else
        format.html { render action: "new" }
        format.json { render json: @hub.errors, status: :unprocessable_entity }
      end
    end
  end


end
