Feature: login a user

  As a user
  so that keep my privacy
  I want to be able login and logout

  Background: Ensure existence of a user
    Given the following user exists:
      | name | email             | password | phone    |
      | Marc | angola@center.com | foo1234  | 03421342 |

  Scenario: login
    Given I am on the home page
    When I click on 'login'
    Then I fill in 'Email' with 'angola@center.com'
    And I fill in 'Password' with 'foo1234'
    And I click on 'Log In'
    Then I should see 'Successfully logged in!'

  Scenario: validate login
    Given I am on the home page
    When I click on 'login'
    Then I fill in 'Email' with 'angola@centers.com'
    And I fill in 'Password' with 'foo'
    And I click on 'Log In'
    Then I should see 'Incorrect email or password, try again.'

  Scenario: logout
    Given I visit the 'angola@center.com' show page
    When I click on 'logout'
    Then I should see 'Logged out!'