Feature: share Recipe
  In order for me to share my recipe
  As a user
  I would like to post then to be available to others

  Background: recipe in database

    Given the following recipe exist:
      | name    | origin     |description             |
      | calulu  | Angola     |tipico de angola        |
      | rancho  | Portugal   |popular food in portugal|
      | cachupa | cape verde |testy                   |


  Scenario: view a recipe
    Given I am on the home page
    Then  I should see 'calulu'
    And   I should see 'Angola'
    And   I should see 'tipico de angola'