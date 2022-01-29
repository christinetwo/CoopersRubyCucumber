class ContactUsPage
  include PageObject
  include DataMagic
  require "selenium-webdriver"

  page_url FigNewton.contacturl
  #no submit button to prevent submit to prod env

  in_iframe(:xpath => '//iframe[@title="NAL Altarama Contact Form"]') do |iframe|
    text_field(:fullname, :id => 'client_name', :frame => iframe)
  end

  in_iframe(:xpath => '//iframe[@title="NAL Altarama Contact Form"]') do |iframe|
    text_field(:email, id: "client_email", :frame => iframe)
  end

  in_iframe(:xpath => '//iframe[@title="NAL Altarama Contact Form"]') do |iframe|
    div(:question, id: "question_text_contentDiv", :frame => iframe)
  end

  in_iframe(:xpath => '//iframe[@title="NAL Altarama Contact Form"]') do |iframe|
    select_list(:affiliation, id: "question_udf_cl07", :frame => iframe)
  end

  in_iframe(:xpath => '//iframe[@title="NAL Altarama Contact Form"]') do |iframe|
    select_list(:topic, name: "question_udf_cl06", :frame => iframe)
  end

  # if specific data is supplied in hash, it will be used instead of the randomized data in config/data/default
  def submit_contact_form(data = {})
    populate_page_with data_for(:contact_us_page, data)
    # page object does not enter text in a div - needed to use selenium
    # this is a case where I would change html if possible
    unique_val = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    @browser.switch_to.frame @browser.find_element(:xpath, '//iframe[@title="NAL Altarama Contact Form"]')
    @browser.find_element(id: 'question_text_contentDiv').send_keys(data["question"] + unique_val)
    @browser.switch_to.default_content
  end

end
