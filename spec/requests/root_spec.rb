require 'spec_helper'

describe "Root" do
  context "when logged in" do
    let!(:user) { Fabricate :user, :confirmed_at => Time.now }
    
    before do
      login_as user
      get "/"
    end
    
    it "routes to the user dashboard page" do
      response.body.should include "Welcome, #{user.email}!"
    end
  end
    
  context "when not logged in" do
    before do
      get "/"
    end

    it "routes to the home page" do
      response.body.should include "Welcome!"
    end     
  end
end