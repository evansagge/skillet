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
    @user = User.new(params[:user])

    respond_with @user do |format|
      if @user.save
        format.html { render :created }
      else
        format.html { render :new }
      end
    end  
  end
  
  def show
    respond_with @user
  end
  
  def edit
    respond_with @user
  end  

  def update
    @user.update_with_password params[:user]
    respond_with @user, :notice => "Your user information has been updated.", :location => user_url
  end

  def destroy
    @user.destroy
    respond_with @user, :notice => "Your account has been deleted.", location: root_url
  end
  
  protected
  
  def set_user
    @user = current_user
  end
end
