Given /^no todo item exists$/ do
  driver = page.driver.browser

  # https://makandracards.com/makandra/16117-how-to-clear-cookies-in-capybara-tests-both-selenium-and-rack-test
  if driver.respond_to?(:clear_cookies)
    driver.clear_cookies
  elsif driver.respond_to?(:manage) and driver.manage.respond_to?(:delete_all_cookies)
    driver.manage.delete_all_cookies
  else
    raise "Don't know how to clear cookies. Weird driver?"
  end
end

Then("I should not see the list") do
  expect(page).not_to have_css('.main')
end

Then("I should not see the footer") do
  expect(page).not_to have_css('.footer')
end

Then("I should not see mark all as complete button") do
  expect(page).not_to have_selector('input#toggle-all', visible: true)
end
