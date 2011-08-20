Feature: Login
  In order to access the other pages in the application
  I need to login using the login form
  
  Scenario: Successful login
    Given I am a user with email "test@example.com" and password "test1234"
    When I go to the login page
    And I fill in the following:
      | Email    | test@example.com |
      | Password | test1234         |
    And I press "Login"
    Then I should be on the home page
    And I should be logged in
    
  Scenario: Failed login
    Given I am a user with email "test@example.com" and password "test1234"
    When I go to the login page
    And I fill in the following:
      | Email    | test@example.com |
      | Password | password         |
    And I press "Login"
    Then I should be on the login page
    And I should see "Invalid email or password"