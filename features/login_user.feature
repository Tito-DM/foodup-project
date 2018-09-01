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
    When I click on 'Log In'
    Then I fill in 'session[email]' with 'angola@center.com'
    And I fill in 'session[password]' with 'foo1234'
    And I click on 'Sign In'
    Then I should see 'Successfully logged in!'

  Scenario: logout
    Given I am on the home page
    When I click on 'Log In'
    Then I fill in 'session[email]' with 'angola@center.com'
    And I fill in 'session[password]' with 'foo1234'
    And I click on 'Sign In'
    Then I should see 'Successfully logged in!'
    Given I visit the 'angola@center.com' show page
    When I click on 'Log Out'
    Then I should see 'Logged out!'

  Scenario: validate login
    Given I am on the home page
    When I click on 'Log In'
    Then I fill in 'session[email]' with 'angola@centers.com'
    And I fill in 'session[password]' with 'foo'
    And I click on 'Sign In'
    Then I should see 'Incorrect email or password, try again.'

