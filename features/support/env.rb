$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'page-object'
require 'require_all'
require 'fig_newton'
require 'data_magic'
require 'rspec'
require 'cucumber'

require_all 'lib'

World(PageObject::PageFactory)

PageObject::PageFactory.routes = {
  :default => [[LandingPage, :food_search_link],
               [SearchPage, :search_page]],

  :search_page =>[[LandingPage, :food_search_link]]
}

PageObject.default_element_wait = 10
PageObject.default_page_wait = 10