require 'spec_helper'

describe "user/new.html.slim" do
  before do
    assign(:user, stub_model(User).as_new_record)
    render
  end

  it "renders the new user form" do
    rendered.should have_selector "form", action: signup_path, method: 'post' do
      rendered.should have_selector "input#user_email", name: "user[email]", type: "email"
      rendered.should have_selector "input#password", name: "user[current_password]", type: "password"
      rendered.should have_selector "input#password_confirmation", name: "user[current_password]", type: "password"
    end
  end
end
