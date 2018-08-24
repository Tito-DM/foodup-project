Feature: Create a user

In order to create a recipe
As a user
I want be able  register

  Scenario: Register a user
    Given I am on the create new recip page
    When  I fill in 'Name' with 'Marc'
    And   I fill in 'phone' with '03421342'
    And   I fill in 'email' with 'Angola@center.com'
    And   I fill in 'password' with 'foo'
    And   I press on register
    Then  I should see 'Profile was successfully created'
    Then  the number of "user" on the database should be 1

  Scenario: validate recipe
    Given I am on the create new recip page
    When  I fill in 'Name' with ''
    And   I fill in 'Origin' with ''
    And   I press on create recipe
    Then  I should see "Name can't be blank"
    And  I should see "Origin can't be blank"




