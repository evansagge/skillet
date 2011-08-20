class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def authenticate_user!
    redirect_to root_url, :alert => I18n.t("devise.failure.unauthenticated") unless user_signed_in?
  end
  
  def authenticate_none!
    redirect_to root_url, :alert => I18n.t("devise.failure.already_authenticated") if user_signed_in?
  end
end
