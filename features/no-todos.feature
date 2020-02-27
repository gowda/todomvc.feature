Feature: List & footer are hidden when no todo exists

Background:
  Given I am on "TodoMVC" page

Scenario: Hide unnecessary details when no todo exists
  Given no todo item exists
  Then I should not see the list
  And I should not see the footer
  And I should not see mark all as complete button
