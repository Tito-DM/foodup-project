Feature: View recipe profile

  As a user
  I want to be able add ingredients and steps for my recipe

  Background: recipe in database

    Given the following recipe exist:
      | name         | origin    |
      | calulu       | Angola    |
      | rancho       | Portugal  |
      | cachupa      | cape verde|

  Scenario: Add step
    Given I am on the details page for 'Calulu'
    When  I fill in 'step' with 'add rice and bees'
    And   I press on 'add step'
    Then  show me the page
    Then  I should see 'Step was successfully add'
