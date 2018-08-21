Feature: Comment recipe

  As a user in order for
  me to give a overview about a
  recipe I would like to be able to comment a post

  Background: recipe in database

    Given the following recipe exist:
      | name    | origin     |description             |
      | calulu  | Angola     |tipico de angola        |
      | rancho  | Portugal   |popular food in portugal|
      | cachupa | cape verde |testy                   |

  Scenario: comment a recipe
    Given I am on the index page
    And   I  click 'comment'
    Then  It should redirect me to 'comment page'
    When  I fell in 'comment' with 'nice food'
    Then  It should redirect me to 'index page'
    And   I should see 'nice food'
