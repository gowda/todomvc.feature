Then /^I should see the new todo form focussed$/ do
  # https://thoughtbot.com/blog/write-reliable-asynchronous-integration-tests-with-capybara#directly-interacting-with-javascript
  find('input.new-todo')

  # https://stackoverflow.com/a/13177528
  expect(
    page.evaluate_script('document.activeElement.getAttribute("class")')
  ).to eql("new-todo")
end

When /^I enter "([^"]*)" in the new todo form$/ do |string|
  find('input.new-todo').native.send_keys(string)
end

When /^I press enter key$/ do
  find('input.new-todo').native.send_keys(:return)
end

When /^I submit the new todo form$/ do
  steps 'Given I press enter key'
end

Then /^I should not see any change in the todo list$/ do
  expect(page).not_to have_css('.main')
  expect(page).not_to have_css('.footer')
end

Then /^I should see "([^"]*)" in the todo list$/ do |string|
  # FIXME: be more specific
  expect(page).to have_text(string)
end
