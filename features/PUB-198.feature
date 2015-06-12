Feature: Cover Images Don't Always Update
  As a User
  I want to check an issue cover image URL is correctly updated

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
    And I select the Issue 303 folder
    And If there is a cover I open and delete it otherwise i continue
    And I navigate to the Compiler login page
    And I enter my username in the username field
    And I enter my password in the password field
    And I click on login button
    Then I should see the compiler build form
    #When I kick off a build for Issue 303
    #And The build completes

    Then I navigate to the Alfreso Login page
    #When I enter my username in the username field
    #And I enter my password in the password field
    #And I click on login button
    #Then I should see the directory page


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
    And I open the xml and check that the cover record details a missing file

    Then I navigate to the Alfreso Login page
    When I select the Search for Sites link from the Sites dropdown
    Then I should see the Site Finder page
    When I enter 'alfrescoAssets' into the search field and select the Search button
    And I select the alfrescoAssets link
    Then I should see the alfrescoAssets page
    When I select the Document Library button
    And I select the Nap folder
    And I select the Magazine folder
    And I select the Issues folder
    And I select and open Issue 300 folder
    And I copy the cover from this Issue to Issue
  # And I wait until 'Successfully copied 1 item(s)' is visible
  And I select the Issues nav button
  And I select the Issue 303 folder
  And I select the en-intl-all.xml file
  And I open the xml and check that the cover record details a missing file

   # And I select the en-intl-all.xml file
    #And I open the xml and check that the Feed Updated, Entry Updated and Entry Published are all displaying as they should in the correct format