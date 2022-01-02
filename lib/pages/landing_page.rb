class LandingPage

  include PageObject
  require 'selenium-webdriver'
  page_url FigNewton.baseurl

  link(:food_search_link, text: "Food Search")
  text_field(:search_box, id: "header-search")
  button(:submit_button, type: "submit")

  def enter_landing_search(search_term)
    self.search_box = search_term
    self.submit_button
    self.wait_until { self.text.include? "Description" }
    # page object does not click on spans -- used selenium
    @browser.find_element(id: 'srlegacy-food-tab-selector').click
  end

end
