Feature: Delete Recipe
  In order for me to manage my recipe
  As a user
  I would like to delete and edit my recipe

  Background: recipe in database
    Given the following user exists:
      | name | email             | password | phone    |
      | Marc | angola@center.com | foo      | 03421342 |

    Given 'angola@center.com' has the following recipe exist:
      | name   | origin     | description      |
      | calulu | Angola     | tipico de angola |
    Given I am on the home page
    When I click on 'Log In'
    Then I fill in 'session[email]' with 'angola@center.com'
    And I fill in 'session[password]' with 'foo'
    And I click on 'Sign In'
    Then I should see 'Successfully logged in!'


  Scenario: delete a recipe
    Given I click on 'delete'
    Then the number of "recipe-del" on the database should be 0


  Scenario: edit a recipe
    Given I click on 'edit'
    And   I fill in 'recipe[name]' with 'calulu edited'
    And   I fill in 'recipe[origin]' with 'Brazil'
    And   I click on 'Update Recipe'
    And   I should see 'calulu edited'
    And   I should see 'Brazil'

