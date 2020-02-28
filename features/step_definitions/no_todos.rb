# frozen_string_literal: true

Then 'I should not see the list' do
  expect(page).not_to have_css('.main')
end

Then 'I should not see the footer' do
  expect(page).not_to have_css('.footer')
end

Then 'I should not see mark all as complete button' do
  expect(page).not_to have_selector('input#toggle-all', visible: true)
end
