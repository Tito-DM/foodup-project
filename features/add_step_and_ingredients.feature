Feature: View recipe profile

  As a user
  I want to be able add ingredients and steps for my recipe

  Background: recipe in database

    Given the following recipe exist:
      | name         | origin    |
      | calulu       | Angola    |
      | rancho       | Portugal  |
      | cachupa      | cape verde|


  Scenario: Add ingredients
    Given I am on the details page for 'Calulu'
    When  I fill in 'Ingredient' with 'rice'
    And   I fill in 'Qty' with '3kg'
    And   I press on 'add ingredient'
    Then show me the page
    Then  I should see 'Ingredient was successfully add'

  Scenario: Add step
    Given I am on the details page for 'Calulu'
    When  I fill in 'step' with 'add rice and bees'
    And   I press on 'add step'
    Then  show me the page
    Then  I should see 'Step was successfully add'

  Scenario: validate input field for ingredient
    Given I am on the details page for 'Calulu'
    When  I fill in 'Ingredient' with ''
    And   I fill in 'Qty' with ''
    And   I press on 'add ingredient'
    Then show me the page
    Then  I should see "Igredient can't be blank"
    Then  I should see "Qty can't be blank"
