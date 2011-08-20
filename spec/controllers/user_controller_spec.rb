require 'spec_helper'

describe UserController do
  let!(:user) { Fabricate :user, :confirmed_at => Time.now }
  
  context "while not logged in" do
    describe "GET new" do
      before do
        get :new
      end
    
      it "assigns a new user as @user" do
        assigns(:user).should be_a_new User
      end
    end
  
    describe "POST create" do
      let(:valid_attributes) { Fabricate.attributes_for :user, :email => 'newuser@example.com' }    
    
      describe "with valid params" do
        before do
          expect {
            post :create, :user => valid_attributes
          }.to change(User, :count).by(1)
        end        

        it "assigns a newly created user as @user" do
          assigns(:user).should be_a User
          assigns(:user).should be_persisted
        end

        it "renders the 'created' template" do
          response.should render_template :created
        end
      end

      describe "with invalid params" do
        before do
          User.any_instance.stub(:save).and_return(false)
          post :create, :user => {}
        end        
      
        it "assigns a newly created but unsaved user as @user" do
          assigns(:user).should be_a_new User
        end

        it "re-renders the 'new' template" do
          response.should render_template 'new'
        end
      end
    end  
    
    describe "GET show" do
      before do
        get :show
      end
      it_should_behave_like "it requires authenticated access"
    end
    
    describe "GET edit" do
      before do
        get :edit
      end
      it_should_behave_like "it requires authenticated access"
    end
    
    describe "PUT update" do
      before do
        put :update
      end
      it_should_behave_like "it requires authenticated access"
    end        
    
    describe "DELETE destroy" do
      before do
        delete :destroy
      end
      it_should_behave_like "it requires authenticated access"
    end            
  end

  context 'while logged in' do
    before do
      login user
      user.should be_logged_in
    end
    
    describe "GET new" do
      before do
        get :new
      end
      it_should_behave_like "it requires unauthenticated access"
    end
    
    describe "PUT create" do
      before do
        put :create
      end
      it_should_behave_like "it requires unauthenticated access"
    end    
    
    describe "GET show" do
      before do
        get :show
      end
    
      it "assigns the requested user as @user" do
        assigns(:user).should eq(user)
      end
      
      it "renders the 'show' template" do
        response.should render_template 'show'
      end      
    end

    describe "GET edit" do
      before do
        get :edit
      end
      
      it "assigns the requested user as @user" do
        assigns(:user).should eq(user)
      end
      
      it "renders the 'edit' template" do
        response.should render_template 'edit'
      end      
    end

    describe "PUT update" do
      context "with valid params" do
        before do
          User.any_instance.should_receive(:update_with_password).with({'these' => 'params'})
          put :update, :user => {'these' => 'params'}
        end
    
        it "assigns the requested user as @user" do
          assigns(:user).should eq(user)
        end
    
        it "redirects to the user" do
          response.should redirect_to user_url
        end
      end
    
      context "with invalid params" do
        before do
          User.any_instance.stub(:save).and_return(false)
          put :update, :user => {}
        end          
          
        it "assigns the user as @user" do
          assigns(:user).should eq(user)
        end
    
        it "re-renders the 'edit' template" do
          response.should render_template 'edit'
        end
      end
    end
    
    describe "DELETE destroy" do
      before do
        expect {
          delete :destroy
        }.to change(User, :count).by(-1)
      end
      
      it "destroys the requested user" do
        expect { user.reload }.to raise_error Mongoid::Errors::DocumentNotFound
      end
      
      it "redirects to the home page" do
        response.should redirect_to root_url
      end
    end
  end
end
