Feature: Counter

Background:
  Given I am on "TodoMVC" page

Scenario: Displays the right pluralized form for none
  Given there are 3 completed todo items
  Then I see the count as "0 items left"

Scenario: Displays the right form for one
  Given there is 1 todo item
  Then I see the count as "1 item left"

Scenario: Displays the right pluralized form for many
  Given there are 3 todo items
  Then I see the count as "3 items left"
