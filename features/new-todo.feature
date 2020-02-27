Feature: New todo form is in focus & accepts the input

Background:
  Given I am on "TodoMVC" page

Scenario: New todo form is in focus
  Given no todo item exists
  Then I should see the new todo form focussed

Scenario: Submitting form with blank string
  Given no todo item exists
  When I enter "         " in the new todo form
  And I submit the new todo form
  Then I should not see any change in the todo list

Scenario: Submitting form with non-blank string
  Given no todo item exists
  When I enter "A fancy new todo item" in the new todo form
  And I press enter key
  Then I should see "A fancy new todo item" in the todo list

Scenario: User input is trimmed for leading & trailing spaces
  Given no todo item exists
  When I enter "   A fancy new todo item  " in the new todo form
  And I press enter key
  Then I should see "A fancy new todo item" in the todo list

Scenario: Submitting with enter key
  Given no todo item exists
  When I enter "         " in the new todo form
  And I press enter key
  Then I should not see any change in the todo list
