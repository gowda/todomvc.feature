# frozen_string_literal: true

Then 'I should see the new todo form focussed' do
  # ensure that the element exists on the page
  find('input.new-todo')
  expect(
    page.evaluate_script('document.activeElement.getAttribute("class")')
  ).to eql('new-todo')
end

When 'I enter {string} in the new todo form' do |string|
  find('input.new-todo').native.send_keys(string)
end

When 'I press enter key' do
  find('input.new-todo').native.send_keys(:return)
end

When 'I submit the new todo form' do
  steps 'Given I press enter key'
end

Then 'I should not see any change in the todo list' do
  expect(page).not_to have_css('.main')
  expect(page).not_to have_css('.footer')
end

Then 'I should see {string} in the todo list' do |string|
  # FIXME: be more specific
  within 'ul.todo-list > li' do
    expect(page).to have_selector('label', text: string)
  end
end
