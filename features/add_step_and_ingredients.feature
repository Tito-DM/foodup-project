Feature: View recipe profile

  As a user
  I want to be able add ingredients and steps for my recipe


  Scenario: Add ingredients
    Given I am on the recipe profile page
    When  I fill in 'ingredient' with 'rice'
    And   I fill in 'qty' with '3kg'
    And   I press on 'add ingredient'
    Then  I should see 'Ingredient was successfully add'
    And   the number of ingredient on database shoul be 1
  # Scenario: Add step
  #   Given I am on the recipe profile page
  #   When  I press on 'add step'
  #   Then  I should see 'step' 1
  #   Then  I should see 'step was successfully add'
  #   And   the number of step on database shoul be 1

