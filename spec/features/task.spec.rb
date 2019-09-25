# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 background  do
  User.create!(name: "margo", email: 'm@gmail.Com',  password: '1234567')
 
end
 scenario "Test task list" do
  visit  root_path
  fill_in  'Email',  with: 'm@gmail.Com'
  fill_in  'Password' ,  with: '1234567'
  click_on  'Log in'
  expect(page).to have_content 'Sample'
  visit new_task_path
  fill_in  'Name' ,  with: 'completed'
  fill_in  'Content' ,  with: 'ruby task'
  click_on  'Create Task'
  visit tasks_path
   expect(page).to have_content 'completed'
   expect(page).to have_content 'completed'
 end
 scenario "Test task creation" do
  visit  root_path
  fill_in  'Email',  with: 'm@gmail.Com'
  fill_in  'Password' ,  with: '1234567'
  click_on  'Log in'
  expect(page).to have_text('Sample')
   # visit to new_task_path (transition to task registration page)
   visit new_task_path
  
   # In the input field labeled "Task Name" and in the input field labeled "Task Details"
   # Fill in the task title and content respectively
   fill_in  'Name' ,  with: 'completed'
   fill_in  'Content' ,  with: 'ruby task'
    #  # Click_on a button with a value (notation letter) of “Register”

   click_on  'Create Task'
   # Check if the information that is supposed to be registered by click is displayed on the task detail page
   # (Assumption that transition to the task details screen will be made if the task is registered)
  # expect(page).to  have_content('testtesttest')
  expect(page).to have_text('Task was successfully created.')
 end
 scenario "Test task details" do
   @task = Task.create!(name: 'test_task_01', content: 'testtesttest',kind_of_task: 'database',start_date: '10.2.2019', end_date: '20.10.2019',priority: 'medium',status: 'completed',user_id: 1)
   visit task_path(id: @task.id)
   expect(page).to have_content('test_task_01')
   expect(page).to have_content('testtesttest')
 end
 scenario 'task must be true' do
  visit  root_path
  fill_in  'Email',  with: 'm@gmail.Com'
  fill_in  'Password',  with: '1234567'
  click_on  'Log in'
  expect(page ).to have_text('Signed in successfully.')
 visit  new_task_path
  fill_in  'Title' ,  with: ' '
  fill_in  'Content' ,  with: 'test'
  click_on 'Create Task'
  expect(page).to have_text('1 error prohibited this task from being saved:')
end

 scenario "Test whether tasks are arranged in descending order of creation date" do
   Task.create!(name: 'test_task_01', content: 'testtesttest',kind_of_task: 'database' ,start_date: '10.2.2019', end_date: '20.10.2019',priority: 'medium',status: 'completed', user_id: 1)
   Task.create!(name: 'test_task_02', content: 'testtesttest2',kind_of_task: 'database', start_date: '10.2.2019', end_date: '20.10.2019',priority: 'medium',status: 'completed', user_id: 1)
   @task = Task.order('created_at ASC')
 end

 it "Validation does not pass if the name is empty" do
  task = Task.new(name: '', content: 'Failure test')
  expect(task).not_to be_valid
end
it "Validation does not pass if content is empty" do
  task = Task.new(name: 'test_task_01', content: '')
  expect(task).not_to be_valid
end
it "validation passes If content is described in name and content" do
  visit  new_task_path
  Task.new(name: 'db', content: 'test')
  expect(task).to be_valid

#  visit  new_task_path
#  fill_in  'Name' ,  with: 'Test name'
#  fill_in  'Content' ,  with: 'test'
  click_on 'Create Task'
  # task = Task.new(name: 'Test', content: 'Failure test')
  expect(page).to have_text('Task was successfully created.')
end

 scenario "Test task updating" do
   task1=Task.create!(name: 'test_task_01', content: 'testtesttest', kind_of_task: 'database', start_date: '10.2.2019', end_date: '20.10.2019',priority: 'medium',status: 'completed',user_id: 1)
   visit edit_task_path(id: task1.id)
   fill_in 'Name', with: 'name update'
   fill_in 'Content', with: 'task update'
   
   click_on 'Update Task'
   visit tasks_path
   expect(page).to have_content('name update')
   expect(page).to have_content('task update')
 end
 
end