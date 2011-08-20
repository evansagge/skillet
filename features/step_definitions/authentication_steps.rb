Given /^I am a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Fabricate(:confirmed_user, email: email, password: password)
end

Then /^I should be already signed in$/ do
  And "I should see \"Logout\""
end

Given /^I am signed up as \"(.*)\/(.*)\"$/ do |email, password|
  Given "I am not logged in"
  When "I go to the sign up page"
  And "I fill in \"Email\" with \"#{email}\""
  And "I fill in \"Password\" with \"#{password}\""
  And "I fill in \"Password confirmation\" with \"#{password}\""
  And "I press \"Sign up\""
  Then "I should see \"You have signed up successfully. If enabled, a confirmation was sent to your email.\""
  And "I am logout"
end

Then /^I log out$/ do
  visit('/logout')
end

Given /^I am logged out$/ do
  Given "I log out"
end

Given /^I am not logged in$/ do
  Given "I log out"
end

When /^I sign in as \"(.*)\/(.*)\"$/ do |email, password|
  Given "I am not logged in"
  When "I go to the login page"
  And "I fill in \"Email\" with \"#{email}\""
  And "I fill in \"Password\" with \"#{password}\""
  And "I press \"Login\""
end

Then /^I should be logged in$/ do
  Then "I should see /logged in/i"
end

When /^I return next time$/ do
  And "I go to the home page"
end

Then /^I should be logged out$/ do
  And "I should see \"Register\""
  And "I should see \"Login\""
  And "I should not see \"Logout\""
end