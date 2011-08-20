require 'spec_helper'

describe User::PasswordsController do
  let!(:user) { Fabricate(:user, confirmed_at: Time.now) }
  
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
    context "with a valid e-mail" do
      subject { post :create, user: { email: user.email } }
      
      it "sends the reset password instructions to the user" do
        User.any_instance.should_receive(:send_reset_password_instructions)
        subject
      end
      
      it "redirects to the login page" do
        subject
        response.should redirect_to login_url
      end
      
      it "set the flash notice message" do
        subject
        flash[:notice].should == I18n.t('devise.passwords.send_instructions')
      end
    end
    
    context "with invalid e-mail" do
      subject { post :create, user: { email: 'someemail@doesnotexist.com' } }
      
      it "does not send any reset password instructions" do
        User.any_instance.should_not_receive(:send_reset_password_instructions)
        subject
      end
      
      it "re-render the 'new' template" do
        subject
        response.should render_template 'new'
      end
      
      it "assigns a newly created and unsaved user with errors to @user" do
        subject
        assigns(:user).should be_a_new User
        assigns(:user).errors.should_not be_empty
      end
    end
  end
  
  describe "GET edit" do
    before do
      get :edit
    end
    
    it "renders the 'edit' template" do
      response.should render_template 'edit'
    end
  end
  
  describe "POST update" do
    before do
      user.send(:generate_reset_password_token!)
    end
      
    context "with a valid reset password token" do
      subject do
        post :update, user: { reset_password_token: user.reset_password_token, password: 'newpass', password_confirmation: 'newpass' }
      end
      
      it "resets the password for the user" do
        User.any_instance.should_receive(:reset_password!).with('newpass', 'newpass')
        subject
      end
      
      it "logs in the user" do
        subject
        warden.user.should == user
      end
      
      it "redirects to the dashboard page" do
        subject
        response.should redirect_to root_url
      end
    end
    
    context "with an invalid reset password token" do
      subject do
        post :update, user: { password: 'newpass', password_confirmation: 'newpass' }
      end
      
      it "does not reset the password for any user" do
        User.any_instance.should_not_receive(:reset_password!).with('newpass', 'newpass')
        subject
      end
      
      it "assigns a new and unsaved user with errors to @user" do
        subject
        assigns(:user).should be_a_new User
        assigns(:user).errors[:reset_password_token].should include "can't be blank"
      end
      
      it "re-renders the 'edit' template" do
        subject
        response.should render_template 'edit'
      end
    end
  end
end