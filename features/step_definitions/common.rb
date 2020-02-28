# frozen_string_literal: true

Given 'I am on {string} page' do |key|
  urls = {
    'TodoMVC' => ENV['TODOMVC_TEST_APP_URL']
  }

  visit urls[key]
end

# FIXME: move to a separate helper file
def clear_cookies(browser)
  if browser.respond_to?(:clear_cookies)
    browser.clear_cookies
  else
    browser.manage.delete_all_cookies
  end
rescue NoMethodError
  raise 'Browser does not support clear cookies'
end

Given 'no todo item exists' do
  clear_cookies(page.driver.browser)
end
