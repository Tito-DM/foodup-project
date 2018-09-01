Feature: Edit and delete ingredients
  As a user
  I want to be able to manage my recepe by
  editing and delete  ingredients

  Background: ingredient in database
    Given the following user exists:
      | name | email             | password | phone    |
      | Marc | angola@center.com | foo      | 03421342 |
    Given 'angola@center.com' has the following recipe exist:
      | name   | origin | description      |
      | calulu | Angola | tipico de angola |
    Given 'calulu' has the following ingredient exist:
      | ingredient  | qty |
      | rice        | 3kg |
    Given I am on the home page
    When I click on 'Log In'
    Then I fill in 'session[email]' with 'angola@center.com'
    And I fill in 'session[password]' with 'foo'
    And I click on 'Sign In'
    Then I should see 'Successfully logged in!'
    And I visit the 'angola@center.com' recipe 'calulu' show page

  Scenario: edit ingredient
    Given I click on 'edit'
    Then I should see 'edit ingredient'
    And I fill in 'Ingredient' with 'fish'
    And I fill in 'Qty' with '4kg'
    And I click on 'Update Ingredient'
    And I should see 'Ingredient was successfully edited'
    And I should see 'fish'
    And I should see '4kg'

  Scenario: delete  ingredient
    Given I click on 'delete'
    Then I should see 'Ingredient was successfully deleted'
    And I should not see 'fish'
    And I should not see '4kg'




