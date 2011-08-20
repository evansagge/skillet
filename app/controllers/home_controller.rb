class HomeController < ApplicationController
  
  def index
    flash.now[:alert] = "Test alert"
    flash.now[:notice] = "Test notice"
  end
  
end