$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'page-object'
require 'require_all'
require 'fig_newton'
require 'data_magic'
require 'rspec'
require 'cucumber'

require_all 'lib'

env_location = ENV['ENV_LOCATION']

if env_location.nil? || env_location.empty?
  env_location = 'qa'
  # uncomment to run other env
  # env_location = 'local'
end

if env_location == 'local'
  FigNewton.load('local.yml')
end


World(PageObject::PageFactory)

PageObject::PageFactory.routes = {
  :default => [[LandingPage, :food_search_link],
               [SearchPage, :search_page]],

  :search_page =>[[LandingPage, :food_search_link]]
}

PageObject.default_element_wait = 10
PageObject.default_page_wait = 10