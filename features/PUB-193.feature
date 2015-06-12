Feature: OPDS Timestamps are correctly formatted for Atom
  As a User
  I want to check the OPDS Timestamps are correctly formatted for Atom

  Scenario: user login to the share area
    Given I am on  the Alfreso Login page
    When I enter my username in the username field
    And I enter my password in the password field
    And I click on login button
    Then I should see the directory page


    When I select the Search for Sites link from the Sites dropdown
    Then I should see the Site Finder page
    When I enter 'alfrescoAssets' into the search field and select the Search button
    And I select the alfrescoAssets link
    Then I should see the alfrescoAssets page
    When I select the Document Library button
    And I select the Nap folder
    And I select the Magazine folder
    And I select the Issues folder
    And I select the en-intl-all.xml file
    And I open the xml and check that the Feed Updated, Entry Updated and Entry Published are all displaying as they should in the correct format