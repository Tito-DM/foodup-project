Feature: search for recipe


   In order to find recipes
   As a u user
   I want to be able to search for particular recipe

    Background: recipe in database
    Given the following user exists:
      | name | email             | password | phone    |
      | marc | angola@center.com | foo      | 03421342 |
      | tito | tito@center.com   | foo12    | 03421342 |


    Given 'angola@center.com' has the following recipe exist:
      | name              | origin      | description      |user_id          |
      | calulu            | angola      | tipico de angola |angola@center.com|
      | mix rice and beans|cabo verde   | nice food        |angola@center.com|
      | fish and chips    | south africa| fishy            |angola@center.com|
      | bolo de banana    | angola      | best cake        |angola@center.com|
      | feijoada          | angola      | testy            |angola@center.com|
    Given 'tito@center.com' has the following recipe exist:
      | name               | origin       | description      | user_id         |
      | rancho             | cabo verde   | nice food        | tito@center.com |
      | bolo de laranja    | angola       | best cake        | tito@center.com |


    Scenario: search recipe by name
    Given I am on the home page
    When I fill in "search_field" with "fish and chips"
    And I check "name"
    And I click on "Search"
    Then I should see "fish and chips"
    And I should not see "mix rice and beans"
    And I should not see "bolo de banana"
    And I should not see "calulu"

  Scenario: search recipe by origin
    Given I am on the home page
    When I fill in "search_field" with "angola"
    And I check "origin"
    And I click on "Search"
    Then I should see "bolo de banana "
    Then I should see "calulu"
    Then I should see "feijoada"
    And I should not see "mix rice and beans"
    And I should not see "fish and chips"

  Scenario: search recipe by creater
    Given I am on the home page
    When I fill in "search_field" with "marc"
    And I check "creater"
    And I click on "Search"
    Then I should see "bolo de banana "
    Then I should see "calulu"
    Then I should see "feijoada"
    When I fill in "search_field" with "tito"
    And I check "creater"
    And I click on "Search"
    Then I should see "rancho "
    Then I should see "bolo de laranja"



