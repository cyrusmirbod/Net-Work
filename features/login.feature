Feature: Login
As a User
I can login to the Alfresco share area

  Scenario: user login to the share area
    Given I am on  the Alfreso Login page
    When I enter my username in the username field
    And I enter my password in the password field
    And I click on login button
    Then I should see the directory page



