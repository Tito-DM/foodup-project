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