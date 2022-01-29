require "selenium-webdriver"

Given('I am on the contact us page') do
  visit ContactUsPage
end

When('I submit a contact form with the following details') do |contact_form_table|
  # if no arguments sent submit_contact_form will use random data except question which is required
  # a unique date time will be added to the question text
  @question_details = contact_form_table.hashes[0]
  @current_page.submit_contact_form(@question_details)
end