class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #the application controller manages every controller of the website

  #i want there to be a short cut of finding the current user across the whole site
  def current_user
  	if session[:user_id].present?
  	User.find(session[:user_id])
  	end
  end

  #to make the current user method above usefull in the views
  helper_method :current_user

  #add a short cut to redirect to the sign up page if not logged out
  def make_sure_logged_in
    if not current_user.present?
      flash[:error] = "you must be signed up to see this page"
      redirect_to new_user_path
    end
  end


end










