class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 helper_method :current_user

 def current_user
  # raise session[:remember_token]
  if session[:remember_token]
  	@current_user ||= User.find(session[:remember_token])
  else
  	@current_user = nil
  end
end


  def authenticate_user
  	if !current_user
  		redirect_to new_sessions_path
	end
	end
end

