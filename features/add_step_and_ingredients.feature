Feature: View recipe profile

  As a user
  I want to be able add ingredients and steps
  for my recipe and view them

  Background: recipe in database
    Given the following user exists:
      | name | email             | password | phone    |
      | Marc | angola@center.com | foo      | 03421342 |

    Given 'angola@center.com' has the following recipe exist:
      | name   | origin | description      |
      | calulu | Angola | tipico de angola |

    And I visit the 'angola@center.com' recipe 'calulu' show page


  Scenario: Add ingredients
    When  I fill in 'Ingredient' with 'rice'
    And   I fill in 'Qty' with '3kg'
    And   I press on add ingredient
    Then  I should see 'Ingredient was successfully add'
    And   I should see 'rice'
    And   I should see '3kg'


  Scenario: validate ingredients
    When  I fill in 'ingredient' with ''
    And   I fill in 'qty' with ''
    And   I press on add ingredient
    Then  I should see "Ingredient can't be blank"
    And   I should see "Qty can't be blank"

  Scenario: Add step
    When  I fill in 'step' with 'add rice and bees'
    And   I press on add step
    Then  I should see 'Step was successfully add'
    And   I should see 'add rice and bees'


  Scenario: validate step
    When  I fill in 'step' with ''
    And   I press on add step
    Then  I should see "Step can't be blank"


