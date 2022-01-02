require 'watir-webdriver'
require 'selenium-webdriver'

Before('@UITests') do
  #need logic for browser selection
  @browser = Selenium::WebDriver.for :chrome
end

After('@UITests') do
  @browser.close
end