require "selenium-webdriver"

Then(/^I should see "([^"]*)"$/) do |message|
  @current_page.wait_until { @current_page.text.include? message }
  @current_page.text.should include message
end