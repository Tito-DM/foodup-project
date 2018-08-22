Feature: Rate a recipe
  In order to show how much I like a recipe
  As a user
  I want be able rate a recipe

  Background: recipe in database

    Given the following recipe exist:
      | name   | origin | description      |
      | calulu | Angola | tipico de angola |


  Scenario: rate a recipe
    Given I am on the home page
    And   I  click 'rate'
    Then  It should redirect me to 'rate page'
    When  I fill in 'rate' with '5'
    And   I press on add rate
    Then  It should redirect me to 'the home page'
    Then  show me the page
    And   I should see 'rate: 5'
