require "selenium-webdriver"

Given('I am on the Search page') do
  visit SearchPage
end

Given('I am on the Landing page') do
  visit LandingPage
end

When('I enter a search for {string}') do |search_term|
  @current_page.wait_until { @current_page.text.include? "Description" }
  @current_page.enter_search(search_term)
end

When('I enter a landing search for {string}') do |search_term|
  @current_page.enter_landing_search(search_term)
end

Then(/^I should see "([^"]*)"$/) do |message|
  @current_page.wait_until { @current_page.text.include? message }
  @current_page.text.should include message
end