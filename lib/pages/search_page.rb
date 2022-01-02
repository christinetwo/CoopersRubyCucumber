class SearchPage
  include PageObject
  require "selenium-webdriver"

  page_url FigNewton.searchurl
  text_field(:search_box, id: "search-page-search-input")
  button(:search_button, id: "search-page-search-button-sidebar")


  def enter_search(search_term)
    self.search_box = search_term
    self.search_button
    # page object does not click on spans -- used selenium
    @browser.find_element(id: 'srlegacy-food-tab-selector').click
  end


end