@ui_tests
Feature: UI Search for nutrition data

  @ui_smoke_test @regression_test @teardown_delete_something
  Scenario Outline: search from search page
    Given I am on the Search page
    When I enter a search for "<food>"
    Then I should see "<result>"
    Examples:
      | food    | result       |
      | Avocado | Oil, avocado |
      | dirt    | 0 results    |

  @ui_smoke_test @teardown_example
  Scenario Outline: search from landing page
    Given I am on the Landing page
    When I enter a landing search for "<food>"
    Then I should see "<result>"
    Examples:
      | food    | result       |
      | Avocado | Oil, avocado |
      | dirt    | 0 results    |