Then "I see the count as {string}" do |string|
  expect(page).to have_selector('span.todo-count', text: string)
end
