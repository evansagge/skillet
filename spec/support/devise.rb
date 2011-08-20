module Devise
  module TestHelpers
    def login(*args)
      sign_in *args
    end
      
    def logout(*args)
      logout *args
    end
  end
end

RSpec::Matchers.define :be_logged_in do
  match do |user|
    warden.authenticated?(:user) and warden.user == user
  end

  description do
    "be logged in"
  end
end

shared_examples_for "it requires authenticated access" do
  it 'redirects to the home page' do
    response.should redirect_to root_url
    flash[:alert].should == I18n.t('devise.failure.unauthenticated')
  end
end

shared_examples_for "it requires unauthenticated access" do
  it 'redirects to the home page' do
    response.should redirect_to root_url
    flash[:alert].should == I18n.t('devise.failure.already_authenticated')
  end
end