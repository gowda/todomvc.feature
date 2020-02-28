Feature: Clear completed button

Background:
  Given I am on "TodoMVC" page
  And there are 5 todo items
  And first two todo items are marked as complete

Scenario: Clicking on show all button
  When I click on show all button
  Then I should see only 5 todo items in the list

Scenario: Clicking on show active button
  When I click on show active button
  Then I should see only 3 todo items in the list

Scenario: Clicking on show completed button
  When I click on show completed button
  Then I should see only 2 todo items in the list
