Feature: Create a recipe

  As a user
  so that a can share my food/drink recip
  I want to be able create a recip

  Background: Ensure existence of a user
    Given the following user exists:
      | name | email             | password | phone    |
      | Marc | angola@center.com | foo      | 03421342 |
    And I visit the 'angola@center.com' show page

  Scenario: Creating a new recipe
    Given I click on 'create a recipe'
    When I fill in 'Name' with 'Arroz com feijao'
    And I fill in 'Origin' with 'Angola'
    And I fill in 'Description' with 'is the most popular food'
    And I click on 'Create Recipe'
    Then I should see 'Recipe was successfully created'
    Then the number of "recip" on the database should be 1

  Scenario: validate recipe
    Given I am on the create new recip page
    When I fill in 'Name' with ''
    And I fill in 'Origin' with ''
    And I click on 'Create Recipe'
    Then I should see "Name can't be blank"
    And I should see "Origin can't be blank"
