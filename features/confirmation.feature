Feature: Confirmation
  In order to finish registration for a user
  I need to confirm the said user registration
  
  Scenario: Successful confirmation
    Given a user exists with an email of "test@example.com"
    When I go to the confirmation page for "test@example.com"
    Then I should be on the home page
    And I should be logged in
    
  Scenario: Failed confirmation
    Given a user exists with an email of "test@example.com"
    When I go to the confirmation page with confirmation token "1234567890"
    Then I should be on the confirmation page
    And I should see "Confirmation token is invalid"
  