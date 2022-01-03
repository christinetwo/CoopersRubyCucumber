require 'selenium-webdriver'

After('@TearDownHookExample') do
  # do some cleanup
  puts 'after scenario teardown was called'
end