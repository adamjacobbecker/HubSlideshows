module SessionsHelper
  def sign_in(hub)
    cookies.permanent[:remember_token] = hub.remember_token
    current_hub = hub
  end
  
  def sign_out
    current_hub = nil
    cookies.delete(:remember_token)
  end
  
  def current_hub=(hub)
    @current_hub = hub
  end
  
  def current_hub
    @current_hub ||= Hub.find_by_remember_token(cookies[:remember_token])
  end
  
  def current_hub?(hub)
    hub == current_hub
  end
  
  def signed_in?
    !current_hub.nil?
  end
  
  def signed_in_hub
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end
end
