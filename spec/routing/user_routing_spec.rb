require "spec_helper"

describe UserController do
  describe "routing" do

    it "routes to #new" do
      get("/signup").should route_to "user#new"
    end
    
    it "routes to #create" do
      post("/signup").should route_to "user#create"
    end    

    it "routes to #show" do
      get("/user").should route_to "user#show"
    end

    it "routes to #edit" do
      get("/user/edit").should route_to "user#edit"
    end

    it "routes to #update" do
      put("/user").should route_to "user#update"
    end

    it "routes to #destroy" do
      delete("/user").should route_to "user#destroy"
    end

  end
end
