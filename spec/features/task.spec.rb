# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
  Task.create!(name: 'test_task_01', content: 'testtesttest')
  Task.create!(name: 'test_task_02', content: 'samplesample')

  # visit to tasks_path (transition to task list page)
  visit tasks_path

  # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method
  save_and_open_page
  expect(page).to have_content 'testtesttest'
  expect(page).to have_content 'samplesample'

  end

  scenario "Test task creation" do
 # visit to new_task_path (transition to task registration page)
  # 1.Write the process to visit new_task_path here

  # In the input field labeled "Task Name" and in the input field labeled "Task Details"
  # Fill in the task title and content respectively
  # 2.Write the process to fill_in (input) the contents in the input field of label name "task name" here
  # 3.Write the process to fill_in (input) the contents in the input column of the label name "task details" here

  # Click_on a button with a value (notation letter) of “Register”
  # 4.Write a process to click_on (click) a button with a value (notation letter) of “Register”

  # Check if the information that is supposed to be registered by click is displayed on the task detail page
  # (Assumption that transition to the task details screen will be made if the task is registered)
  # 5.On the task detail page, Write a code to check (expect) whether the data (description) that should have been created by the test code is have_content (included)
  end

  scenario "Test task details" do

  end
end