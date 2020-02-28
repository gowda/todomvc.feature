# frozen_string_literal: true

Then 'I do not see the label for the item' do
  within @item do
    expect(page).not_to have_selector('label', visible: true)
  end
end

Then 'I should see the edit form for the item' do
  within @item do
    expect(page).to have_selector('input.edit', visible: true)
  end
end

Then 'I should see the edit form for the item focussed' do
  within @item do
    find('input.edit')

    expect(
      page.evaluate_script('document.activeElement.getAttribute("class")')
    ).to eql('edit')
  end
end

When 'I enter {string} in the edit form for the item' do |string|
  within @item do
    find('input.edit').native.send_keys(string)
  end
end

When 'I click on the page footer' do
  find('footer.info').click
end

Then 'I should see {string} in the list' do |string|
  within 'ul.todo-list' do
    expect(page).to have_selector('label', text: string)
  end
end

When 'I press esc key' do
  within @item do
    find('input.edit').native.send_keys(:escape)
  end
end

When 'I clear the edit form for the item' do
  within @item do
    find('input.edit').set('', clear: :backspace)
  end
end

Then 'I should see the item unchanged in the list' do
  within @item do
    expect(page).to have_selector('label', text: @item_label)
  end
end

Then 'I should not see the item in the list' do
  within 'ul.todo-list' do
    expect(page).not_to have_selector('label', text: @item_label)
  end
end
