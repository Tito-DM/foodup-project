Feature: view Recipe

   As a user
   in order for me to share my recipe I would
   like to post then to be available to other

  Background: recipe in database

    Given the following recipe exist:
      | name    | origin     |description             |
      | calulu  | Angola     |tipico de angola        |
      | rancho  | Portugal   |popular food in portugal|
      | cachupa | cape verde |testy                   |


  Scenario: view a recipe
    Given I am on the index page
    Then  I should see 'calulu'
    And   I should see 'Angola'
    And   I should see 'tipico de angola'