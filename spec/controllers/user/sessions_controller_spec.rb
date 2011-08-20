require 'spec_helper'

describe User::SessionsController do
  let!(:user) { Fabricate :user, :password => "pass1234", :confirmed_at => Time.now }
  
  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  describe "GET new" do
    before do
      get :new
    end
    
    it "renders the 'new' template" do
      response.should render_template 'new'
    end
  end
  
  describe "POST create" do
    context "with valid login credentials" do
      before do
        post :create, user: { email: user.email, password: 'pass1234' }
      end
      
      it "logins the user" do
        warden.user.should == user
      end
      
      it "redirects to the user dashboard page" do
        response.should redirect_to root_url
      end
      
      it "set the flash notice message" do
        flash[:notice].should == "Signed in successfully."
      end
    end
    
    context "with invalid login credentials" do
      before do
        post :create, user: {}
      end
        
      it "does not log in any user" do
        warden.user.should be_nil
      end
      
      it "re-renders the 'new' page" do
        response.should render_template 'new'
      end
      
      it "sets the flash alert message" do
        flash[:alert].should == "Invalid email or password."
      end
    end
  end
  
  shared_examples_for "destroy" do
    before do
      login user
      warden.user.should == user
    end
          
    it "logs out the user" do
      warden.user.should be_nil
    end
    
    it "redirects to the root url" do
      response.should redirect_to root_url
    end
    
    it "set the flash notice message" do
      flash[:notice].should == "Signed out successfully."
    end
  end
  
  describe "DELETE destroy" do    
    it_should_behave_like "destroy" do
      before do
        delete :destroy
      end      
    end
  end
  
  describe "GET destroy" do
    it_should_behave_like "destroy" do
      before do
        get :destroy
      end
    end      
  end  
end