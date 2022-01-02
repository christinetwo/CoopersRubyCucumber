@APITests
Feature: API Search for nutrition data

  @smokeTest @regressionTest
  Scenario Outline: Request Search list
    When I request a limited food search with the following parameters
      | query      | generalSearchInput | pageNumber | numberOfResultsPerPage | pageSize | requireAllWords |
      | <foodName> | <foodName>         | 1          | 50                     | 3        | true            |
    Then I should see 200 result
    Then I should see "<resultText>" returned in the "description" JSON foods path
    Examples:
      | foodName | resultText |
      | Carrots  | CARROTS    |
      | Tomato   | TOMATO     |

  @regressionTest
  Scenario: Confirm Number of results per page is correct
    When I request a limited food search with the following parameters
      | query        | numberOfResultsPerPage | pageSize |
      | avocado, raw | 3                      | 3        |
    Then I should see 200 result
    Then I should see 3 "foods" items returned