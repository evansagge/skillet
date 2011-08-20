require 'spec_helper'

describe User::PasswordsController do
  
  describe "routing" do

    it "routes to #new" do
      get("/password/new").should route_to "user/passwords#new"
    end
    
    it "routes to #create" do
      post("/password").should route_to "user/passwords#create"#, :password_token => "123546475890")
    end    

    it "routes to #edit" do
      get("/password/edit").should route_to "user/passwords#edit"#, :password_token => "123546475890")
    end
    
    it "routes to #update" do
      put("/password").should route_to "user/passwords#update"#, :password_token => "123546475890")
    end    

  end
    
end