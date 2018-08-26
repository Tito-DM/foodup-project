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
    And I visit the 'angola@center.com' show page


  Scenario: delete a recipe
    Given I click on 'delete recipe'
    Then  The number of "recipe-del" should be igual 0


  Scenario: edit a recipe
    Given I click on 'edit recipe'
    And   I fill in 'Name' with 'calulu edited'
    And   I fill in 'Origin' with 'Brazil'
    And   I click on 'Update Recipe'
    And   I should see 'calulu edited'
    And   I should see 'Brazil'

