require 'spec_helper'

describe "user/edit.html.slim" do
  let!(:user) { assign :user, Fabricate(:user) }  
  
  before do
    render
  end
  
  it "renders the edit user form" do
    rendered.should have_selector "form", action: user_path, method: 'post' do
      rendered.should have_selector "input#user_email", name: "user[email]", type: "email", disabled: true
      rendered.should have_selector "input#current_password", name: "user[current_password]", type: "password"
      rendered.should have_selector "input#password", name: "user[current_password]", type: "password"
      rendered.should have_selector "input#password_confirmation", name: "user[current_password]", type: "password"
    end
  end
end
