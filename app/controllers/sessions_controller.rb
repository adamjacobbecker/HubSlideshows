class SessionsController < ApplicationController
  def new
  end
  
  def create
    hub = Hub.find_by_email(params[:email])
    if hub && hub.authenticate(params[:password])
      sign_in hub
      redirect_back_or hub
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
