class UserController < ApplicationController
  before_filter :authenticate_none!, only: %w(new create)    
  before_filter :authenticate_user!, except: %w(new create)
  before_filter :set_user, except: %w(new create)
  
  respond_to :html, :json, :xml

  def new
    @user = User.new
    respond_with @user
  end
  
  def create
    @user = User.create(params[:user])
    respond_with @user do |format|
      format.html { render :created } if @user.persisted?
    end
  end
  
  def show
    respond_with @user
  end
  
  def edit
    respond_with @user
  end  

  def update
    flash[:notice] = I18n.t('users.update.success') if @user.update_with_password(params[:user])
    respond_with @user, location: user_url
  end

  def destroy
    @user.destroy
    sign_out :user
    flash[:notice] = I18n.t('users.destroy.success')
    respond_with @user, location: root_url
  end
  
  protected
  
  def set_user
    @user = current_user
  end
end
