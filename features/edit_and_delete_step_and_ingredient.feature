Feature: Edit and delete a steps and ingredients
  As a user
  I want to be able to manage my recepe by
  editing and delete steps and ingredients

  Background: ingredient in database

    Given the following ingredients exist:
      | ingredient   | qty |
      | fish         | 3   |
      | tomatos      | 4   |
      | onion        | 1   |

  Scenario: delete  ingredient
    Given I am on the details page for 'Calulu'
    Then  I select a ingredient
    And   I follow 'delete'
    Then  show me the page
    Then  I should not  see 'Ingredient was successfully deleted'

  Scenario: delete a edit
    Given I am on the details page for 'Calulu'
    When  I fill in 'Ingredient' with 'rice'
    And   I fill in 'Qty' with '3kg'
    And   I press on add ingredient
    And   I follow 'edit'
    Then  show me the page
    Then  I should see 'Ingredient was successfully edited'


