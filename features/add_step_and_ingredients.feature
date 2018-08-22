Feature: View recipe profile

  As a user
  I want to be able add ingredients and steps
  for my recipe and view them

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
    And   I press on add ingredient
    Then  show me the page
    Then  I should see 'Ingredient was successfully add'
    And   I should see 'rice'
    And   I should see '3kg'


  Scenario: validate ingredients
    Given I am on the details page for 'Calulu'
    When  I fill in 'ingredient' with ''
    And   I fill in 'qty' with ''
    And   I press on add ingredient
    Then  I should see "Ingredient can't be blank"
    And   I should see "Qty can't be blank"

  Scenario: Add step
    Given I am on the details page for 'Calulu'
    When  I fill in 'step' with 'add rice and bees'
    And   I press on add step
    Then  show me the page
    Then  I should see 'Step was successfully add'
    And   I should see 'add rice and bees'


  Scenario: validate step
    Given I am on the details page for 'Calulu'
    When  I fill in 'step' with ''
    And   I press on add step
    Then  I should see "Step can't be blank"


