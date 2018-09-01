Feature: share Recipe
  In order for me to share my recipe
  As a user
  I would like to post then to be available to others

  Background: recipe in database
    Given the following user exists:
      | name | email             | password | phone    |
      | Marc | angola@center.com | foo      | 03421342 |

    Given  'angola@center.com' has the following recipe exist:
      | name    | origin     |description             |
      | calulu  | Angola     |tipico de angola        |
      | rancho  | Portugal   |popular food in portugal|
      | cachupa | cape verde |testy                   |


  Scenario: view a recipe
    Given I am on the home page
    Then  I should see 'calulu'
    And   I should see 'Angola'
    And   I should see 'tipico de angola'
    And  I should see 'rancho'
    And   I should see 'Portugal'
    And   I should see 'popular food in portugal'
    And  I should see 'cachupa'
    And   I should see 'cape verde'
    And   I should see 'testy'