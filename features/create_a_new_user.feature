Feature: Create a user

In order to create a recipe
As a user
I want be able  register

  Scenario: Register a user
    Given I am on the create new user page
    When  I fill in 'Name' with 'Marc'
    And   I fill in 'Email' with 'Angola@center.com'
    And   I fill in 'Password' with 'foo'
    And   I fill in 'Phone' with '03421342'
    And   I press on create user
    Then  I should see 'Profile was successfully created'
    Then  the number of "user" on the database should be 1





