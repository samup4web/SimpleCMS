class ApplicationController < ActionController::Base
  #protect against CSRF - Cross-site request forgery
  protect_from_forgery

  protected

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false #halts the before filter
    else
      return true
    end
  end
end
