require 'spec_helper'

describe User::SessionsController do
  
  describe "routing" do

    it "routes to #new" do
      get("/login").should route_to "user/sessions#new"
    end
    
    it "routes to #create" do
      post("/login").should route_to "user/sessions#create"
    end    

    it "routes to #destroy via DELETE" do
      delete("/logout").should route_to "user/sessions#destroy"
    end

    it "routes to #destroy via GET" do
      get("/logout").should route_to "user/sessions#destroy"
    end

  end
    
end