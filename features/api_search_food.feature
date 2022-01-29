@api_tests
Feature: API Search for nutrition data

  @smoke_test @regression_test
  Scenario Outline: Request Search list
    # all search params are optional except query
    When I request a limited food search with the following parameters
      | query      | generalSearchInput | pageNumber | numberOfResultsPerPage | pageSize | requireAllWords |
      | <foodName> | <foodName>         | 1          | 50                     | 3        | true            |
    Then I should see 200 result
    Then I should see "<resultText>" returned in the "description" JSON foods path
    Examples:
      | foodName | resultText |
      | Carrots  | CARROTS    |
      | Tomato   | TOMATO     |

  @regression_test
  Scenario: Confirm number of results per page is correct
    When I request a limited food search with the following parameters
      | query        | numberOfResultsPerPage | pageSize |
      | avocado, raw | 3                      | 3        |
    Then I should see 200 result
    Then I should see 3 "foods" items returned