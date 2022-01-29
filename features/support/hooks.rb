require 'selenium-webdriver'

Before('@ui_tests') do
  browser_type = ENV['BROWSER_TYPE']

  if browser_type.nil? || browser_type.empty?
    # for running in rubymine default is chrome
    # uncomment for other browser types
     browser_type = 'chrome'
    # browser_type = 'firefox'
    # browser_type = 'chrome_mobile'
    # browser_type = 'headless'
    # browser_type = 'chrome_ipad'
  end

  browser_options = ::Selenium::WebDriver::Chrome::Options.new

  case browser_type
  when 'chrome'
    @browser = Selenium::WebDriver.for :chrome
  when 'chrome_mobile'
    browser_options.add_emulation(device_name: 'iPhone X')
    @browser = Selenium::WebDriver.for :chrome, :options => browser_options
  when 'headless'
    browser_options.args << '--headless'
    @browser = Selenium::WebDriver.for :chrome, :options => browser_options
  when 'chrome_ipad'
    browser_options.add_emulation(device_name: 'iPad')
    @browser = Selenium::WebDriver.for :chrome, :options => browser_options
  when 'firefox'
    @browser = Selenium::WebDriver.for :firefox
  else
    @browser = Selenium::WebDriver.for :chrome
  end

end

After('@ui_tests') do
  @browser.close
end