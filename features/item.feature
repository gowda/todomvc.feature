Feature: Individual todo item

Background:
  Given I am on "TodoMVC" page
  And there are 5 todo items

Scenario: Marking as complete
  Given I am working on first item in the list
  When I click on mark as complete item
  Then I should see item marked as complete
  And I should be able to inspect parent 'li' tag to have class "completed"

Scenario: Double clicking on the list item
  Given I am working on first item in the list
  When I double click on the item
  Then I should see edit form open for the item

Scenario: Remove button
  Given I am working on first item in the list
  When I hover on the item
  Then I should see delete button for the item
