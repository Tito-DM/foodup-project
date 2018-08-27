Feature: Comment recipe
  In order to give a overview about a recipe
  As a user
  I want to be able to comment a recipe

  Background: recipe in database
    Given the following user exists:
      | name | email             | password | phone    |
      | Marc | angola@center.com | foo      | 03421342 |
   Given 'angola@center.com' has the following recipe exist:
      | name   | origin     | description      |
      | calulu | Angola     | tipico de angola |


  Scenario: comment a recipe
    Given I am on the home page
    When I click on 'comment'
    Then I fill in 'comment' with 'nice food'
    And I click on 'add comment'
    And I should see 'nice food'
