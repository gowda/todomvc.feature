# frozen_string_literal: true

Then 'I should not see clear completed button' do
  expect(page).not_to have_selector('button.clear-completed', visible: true)
end

Given 'first two todo items are marked as complete' do
  find_all('ul.todo-list > li').take(2).each do |node|
    node.find('div.view > input.toggle', visible: false).set(true)
  end
end

When 'I click clear completed button' do
  find('button.clear-completed').click
end

Then 'I should see only {int} todo items in the list' do |int|
  expect(find_all('ul.todo-list > li').length).to eql(int)
end
