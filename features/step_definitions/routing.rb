# frozen_string_literal: true

When 'I click on show all button' do
  find('ul.filters > li > a', text: 'All').click
end

When 'I click on show active button' do
  find('ul.filters > li > a', text: 'Active').click
end

When 'I click on show completed button' do
  find('ul.filters > li > a', text: 'Completed').click
end
