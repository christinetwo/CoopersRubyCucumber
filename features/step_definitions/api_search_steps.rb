require 'oj'
require 'net/http'
require 'json'

When('I request a limited food search with the following parameters') do |request_table|
  #turn table to hash to search json,  all params are optional except query
  request_hash = request_table.hashes
  rawHash = request_hash[0]
  request_json = SearchEndpoint.new(rawHash["query"], rawHash["pageNumber"], rawHash["generalSearchInput"],
                                    rawHash["numberOfResultsPerPage"], rawHash["pageSize"], rawHash["requireAllWords"])
  request_body = request_json.to_json
  req = EndpointRequest.new("/foods/search", request_body)
  result = req.post_request
  @result_body = result.body
  @status_code = result.code

end

Then('I should see {int} result') do |expected_code|
  @status_code.should.equal? expected_code
end


Then('I should see {string} returned in the {string} JSON foods path') do |expected_value, json_key|
  parsed_json = JSON.parse(@result_body)
  actual_list = parsed_json['foods'].collect { |item| item[json_key] }
  expect(actual_list).to include(expected_value)
end

Then(/^I should see (\d+) "([^"]*)" items returned$/) do |number_returned, item|
  count = JSON.parse(@result_body)[item].size
  count.should.equal? number_returned
end