Requirements:

1.  Chrome driver exe version that matches your version of Chrome located on path
2.  Ruby 3.0
3.  get an api key from https://fdc.nal.usda.gov/api-key-signup.html
4.  Add .api_key.rb to root dir, with $api_key = "your Key"

To run via terminal
run all tests with chrome for ui run: rake features
Chrome UI tests only run: rake ui_only
API tests only run: rake api_only
ALl tests with Chrome headless run: rake all_headless
Chrome smoke test run: rake ui_only_smoke_test
