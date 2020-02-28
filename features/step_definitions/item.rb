# frozen_string_literal: true

Given 'I am working on first item in the list' do
  @item = first('ul.todo-list > li')
  @item_label = @item.find('label').text
end

When 'I click on mark as complete item' do
  @item.find('div.view > input.toggle', visible: false).set(true)
end

Then 'I should see item marked as complete' do
  checkbox = @item.find('div.view > input.toggle', visible: false)
  expect(checkbox['checked']).to eql('true')
end

Then 'I should be able to inspect parent to have class {string}' do |name|
  expect(@item.reload['class']).to eql(name)
end

When 'I double click on the item' do
  @item.double_click
end

Then 'I should see edit form open for the item' do
  within @item do
    expect(page).to have_selector('input.edit', visible: true)
  end
end

When 'I hover on the item' do
  @item.hover
end

Then 'I should see delete button for the item' do
  within @item do
    expect(page).to have_selector('button.destroy', visible: true)
  end
end
