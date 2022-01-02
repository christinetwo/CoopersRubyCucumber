@UITests
Feature: UI Search for nutrition data

  @smokeTest @regressionTest @tearDownDeleteSomething
  Scenario Outline: search from search page
    Given I am on the Search page
    When I enter a search for "<food>"
    Then I should see "<result>"
    Examples:
      | food    | result       |
      | Avocado | Oil, avocado |
      | dirt    | 0 results    |

  @smokeTest
  Scenario Outline: search from landing page
    Given I am on the Landing page
    When I enter a landing search for "<food>"
    Then I should see "<result>"
    Examples:
      | food    | result       |
      | Avocado | Oil, avocado |
      | dirt    | 0 results    |