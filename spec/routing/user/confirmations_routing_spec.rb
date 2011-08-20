require 'spec_helper'

describe User::ConfirmationsController do
  
  describe "routing" do

    it "routes to #new" do
      get("/confirmation/new").should route_to "user/confirmations#new"
    end
    
    it "routes to #create" do
      post("/confirmation?confirmation_token=123546475890").should route_to "user/confirmations#create"#, :confirmation_token => "123546475890")
    end    

    it "routes to #show" do
      get("/confirmation?confirmation_token=123546475890").should route_to "user/confirmations#show"#, :confirmation_token => "123546475890")
    end

  end
    
end