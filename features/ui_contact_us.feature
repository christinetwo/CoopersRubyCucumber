@ui_tests
Feature: UI Contact us page

  # examples using iFrame and data magic for random data in submit form
  # this example does not actually submit only enters data in iFrame

  @ui_smoke_test @regression_test
  Scenario: Submit a question
    Given I am on the contact us page
    When I submit a contact form with the following details
      | fullname      | email                       | affiliation | topic             | question                 |
      | Tester Mctest | testermctest@mailinator.com | Consumer    | FoodData Requests | How do I send a request? |
    Then I should see "Queries and Comments about FoodData Central"

  @regression_test
  Scenario: Example of randomized inputs for submit a question
    Given I am on the contact us page
    When I submit a contact form with the following details
      | question     |
      | unique value |
    Then I should see "Queries and Comments about FoodData Central"