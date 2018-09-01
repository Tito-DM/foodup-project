Feature: Create a user

In order to create a recipe
As a user
I want be able  register

  Scenario: Register a user
    Given I am on the create new user page
    When  I fill in 'user[name]' with 'Marc'
    And   I fill in 'user[email]' with 'Angola@center.com'
    And   I fill in 'user[password]' with 'foo'
    And   I fill in 'user[phone]' with '03421342'
    And   I press on Sign Up
    Then  I should see 'Profile was successfully created'
    Then  the number of "user" on the database should be 1





