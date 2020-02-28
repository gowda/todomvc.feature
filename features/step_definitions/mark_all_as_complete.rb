# frozen_string_literal: true

Given 'there is 1 todo item' do
  find('input.new-todo').native.send_keys('Test todo no. 1')
  find('input.new-todo').native.send_keys(:return)
end

Given 'there are {int} todo items' do |count|
  count.times.each do |counter|
    find('input.new-todo').native.send_keys("Test todo #{counter}")
    find('input.new-todo').native.send_keys(:return)
  end
end

Given 'there are {int} completed todo items' do |count|
  # FIXME: call 'there are [\d]+ todo items' before marking as complete
  count.times.each do |counter|
    find('input.new-todo').native.send_keys("Test todo #{counter}")
    find('input.new-todo').native.send_keys(:return)

    find('label', text: "Test todo #{counter}")
      .sibling('input', visible: false)
      .set(true)
  end
end

When 'I click on mark all as complete button' do
  find('label[for="toggle-all"]').click
end

Then 'I should see mark all as complete button checked' do
  checkbox = find('input#toggle-all', visible: false)
  expect(checkbox['checked']).to eql('true')
end

Then 'I should see every todo item with completed button checked' do
  find_all('ul.todo-list > li').each do |item|
    checkbox = item.find('div.view > input.toggle', visible: false)
    expect(checkbox['checked']).to eql('true')
  end
end

When 'I click on clear completed button' do
  find('button.clear-completed').click
end

Then 'I should see mark all as complete button unchecked' do
  checkbox = find('input#toggle-all', visible: false)
  expect(checkbox['checked']).not_to be_truthy
end

When 'I click on mark as complete on first item in the list' do
  first('ul.todo-list > li')
    .find('div.view > input.toggle', visible: false)
    .set(false)
end
