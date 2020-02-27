Given /^I am on "([^"]*)" page$/ do |key|
  urls = {
    'TodoMVC' => ENV['TODOMVC_TEST_APP_URL']
  }

  visit urls[key]
end
