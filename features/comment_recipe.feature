Feature: Comment recipe
  In order to give a overview about a recipe
  As a user
  I want to be able to comment a recipe

  Background: recipe in database

    Given the following recipe exist:
      | name    | origin     |description             |
      | calulu  | Angola     |tipico de angola        |


  Scenario: comment a recipe
    Given I am on the home page
    And   I  click 'comment'
    Then  It should redirect me to 'comment page'
    When  I fill in 'comment' with 'nice food'
    And   I press on add comment
    Then  It should redirect me to 'the home page'
    Then  show me the page
    And   I should see 'nice food'
