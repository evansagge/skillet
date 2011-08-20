class User::SessionsController < Devise::SessionsController
  # before_filter :authenticate_user!, only: %w(delete)
  # 
  # respond_to :html, :json, :xml
  # 
  # def new
  #   @user = User.new
  #   @user.clean_up_passwords
  #   respond_with @user
  # end
  # 
  # def create
  #   @user = warden.authenticate!(scope: user, recall: "user/session#new")
  #   sign_in :user, @user
  #   flash[:notice] = "You have successfully logged in."
  #   respond_with @user, location: root_url
  # end
  # 
  # def destroy
  #   sign_out :user
  #   flash[:notice] = "You have successfully logged out."
  #   respond_with @user, location: login_url
  # end
end