Feature: Mark all as complete

Background:
  Given I am on "TodoMVC" page

Scenario: Marking all as complete
  Given there are 5 todo items
  When I click on mark all as complete button
  Then I should see mark all as complete button checked
  And I should see every todo item with completed button checked

Scenario: Clear completed
  Given there are 5 todo items
  When I click on mark all as complete button
  And I click on clear completed button
  Then I should not see mark all as complete button

Scenario: Every todo item is completed
  Given there are 5 completed todo items
  Then I should see mark all as complete button checked

Scenario: Marking one todo as incomplete
  Given there are 2 completed todo items
  When I click on mark as complete on first item in the list
  Then I should see mark all as complete button unchecked
