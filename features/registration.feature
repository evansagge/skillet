Feature: Registration
  In order to gain access to the application
  I need to register using the registration form
    
  Scenario: Failed registration
    Given I am on the register page
    When I fill in the following:
      | Email            | invalidemail |
      | Password         |              |
      | Confirm Password |              |    
    And I press "Register"
    Then I should see "Some errors were found, please take a look:"
    
  Scenario: Successful registration
    Given I am on the register page
    When I fill in the following:
      | Email            | test@example.com |
      | Password         | test1234         |
      | Confirm Password | test1234         |
    And I press "Register"
    Then I should see "We have sent you an email with instructions on how to confirm your registration."
    And I should see "Please click on the link to complete your registration."  