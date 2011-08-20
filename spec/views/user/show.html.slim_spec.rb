require 'spec_helper'

describe "user/show.html.slim" do
  let!(:user) { assign :user, Fabricate(:user, :last_sign_in_at => 2.days.ago) }
  
  before do
    render
  end

  it "renders attributes in <p>" do
    rendered.should match %r(Email(.+)#{user.email})
    rendered.should match %r(Last sign in at(.+))
  end
end
