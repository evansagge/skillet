class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def authenticate_none!
    redirect_to root_url, :alert => "You need to be logged out to access this page." if user_signed_in?
  end
  
  def authenticate_user!
    redirect_to root_url, :alert => "You need to be logged in to access this page." unless user_signed_in?
  end
end
