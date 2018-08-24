Feature: Delete Recipe
  In order for me to manage my recipe
  As a user
  I would like to delete and edit my recipe

  Background: recipe in database

    Given the following recipe exist:
      | name    | origin     | description              |
      | calulu  | Angola     | tipico de angola         |
      | rancho  | Portugal   | popular food in portugal |
      | cachupa | cape verde | testy                    |


  Scenario: delete a recipe
    Given I am on the details page for 'Calulu'
    And   I  click 'delete recipe'
    Then  The number of recipe should be igual 2

  Scenario: edit a recipe
    Given I am on the details page for 'Calulu'
    When  I  click 'edit recipe'
    And   I fill in 'name' with 'calulu edited'
    And   I fill in 'origin' with 'Brazil'
    Then  It should redirect me to the details page for 'Calulu'
    And   I should see 'calulu edited'
    And   I should see 'Brazil'

