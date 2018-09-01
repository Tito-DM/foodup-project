Feature: Edit and delete steps
  As a user
  I want to be able to manage my recepe by
  editing and delete steps

  Background: ingredient in database
    Given the following user exists:
      | name | email             | password | phone    |
      | Marc | angola@center.com | foo      | 03421342 |
    Given 'angola@center.com' has the following recipe exist:
      | name   | origin | description      |
      | calulu | Angola | tipico de angola |

    Given 'calulu' has the following step exist:
      | step |
      | mix rice with water|

    Given I am on the home page
    When I click on 'Log In'
    Then I fill in 'session[email]' with 'angola@center.com'
    And I fill in 'session[password]' with 'foo'
    And I click on 'Sign In'
    Then I should see 'Successfully logged in!'
    And I visit the 'angola@center.com' recipe 'calulu' show page

  Scenario: edit step
    Given I click on 'edit'
    Then I should see 'edit Step'
    And I fill in 'Step' with 'mix rice with water and salt'
    And I click on 'Update Step'
    And I should see 'step was successfully edited'
    And I should see 'mix rice with water and salt'

  Scenario: delete  step
    Given I click on 'delete'
    Then I should see 'step was successfully deleted'
    And I should not see 'mix rice with water and salt'




