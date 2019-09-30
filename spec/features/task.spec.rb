# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 background  do
  User.create!(name: "margo", email: 'm@gmail.Com',  password: '0000000')
  
end
 scenario "Test task list" do
  visit  root_path
   fill_in  'Email',  with: 'm@gmail.Com'
   fill_in  'Password' ,  with: '0000000'
   click_on  'Log in'
   expect(page).to have_text('')

   Task.create!(titles: 'test_task_1', content: 'testtesttest',start_date: '10.2.2019', end_date: '20.10.2019',kind_of_task: 'database',priority: 'medium', status: 'completed')
   Task.create!(titles: 'test_task_2', content: 'samplesample',start_date: '10.2.2019', end_date: '20.10.2019',kind_of_task: 'database',priority: 'medium', status: 'completed')
   visit tasks_path
   save_and_open_page
   expect(page).to have_content 'testtesttest'
   expect(page).to have_content 'samplesample'
 end
 scenario "Test task creation" do
  visit  root_path
   fill_in  'Email',  with: 'm@gmail.Com'
   fill_in  'Password' ,  with: '0000000'
   click_on  'Log in'
   expect(page).to have_text('')
   # visit to new_task_path (transition to task registration page)
   visit new_task_path
  
   # In the input field labeled "Task Name" and in the input field labeled "Task Details"
   # Fill in the task title and content respectively
   fill_in  'Titles' ,  with: 'completed'
   fill_in  'Content' ,  with: 'ruby task'
  #  Task.create!(name: 'test_task_1', content: 'testtesttest',start_date: '10.2.2019', end_date: '20.10.2019',kind_of_task: 'database',priority: 'medium', status: 'completed')
  #  Task.create!(name: 'test_task_2', content: 'samplesample',start_date: '10.2.2019', end_date: '20.10.2019',kind_of_task: 'database',priority: 'medium', status: 'completed')
  #  # Click_on a button with a value (notation letter) of “Register”
   click_on  'Create Task'
   # Check if the information that is supposed to be registered by click is displayed on the task detail page
   # (Assumption that transition to the task details screen will be made if the task is registered)
   expect(page).to  have_content('Task was successfully created.')
 end
 scenario "Test task details" do
  visit  root_path
   fill_in  'Email',  with: 'm@gmail.Com'
   fill_in  'Password' ,  with: '0000000'
   click_on  'Log in'
   expect(page).to have_text('')
   @task = Task.create!(titles: 'test_task_01', content: 'testtesttest',kind_of_task: 'database',start_date: '10.2.2019', end_date: '20.10.2019',priority: 'medium',status: 'completed')
   visit task_path(id: @task.id)
   expect(page).to have_content('test_task_01')
   expect(page).to have_content('testtesttest')
 end
 scenario "Test whether tasks are arranged in descending order of creation date" do
   Task.create!(titles: 'test_task_01', content: 'testtesttest',kind_of_task: 'database' ,start_date: '10.2.2019', end_date: '20.10.2019',priority: 'medium',status: 'completed')
   Task.create!(titles: 'test_task_02', content: 'testtesttest2',kind_of_task: 'database', start_date: '10.2.2019', end_date: '20.10.2019',priority: 'medium',status: 'completed')
   @task = Task.order('created_at ASC')
 end
 scenario "Test task updating" do
   task1=Task.create!(titles: 'test_task_01', content: 'testtesttest', kind_of_task: 'database', start_date: '10.2.2019', end_date: '20.10.2019',priority: 'medium',status: 'completed')
   visit edit_task_path(id: task1.id)
   fill_in 'Titles', with: 'titles update'
   fill_in 'Content', with: 'task update'
   
   click_on 'Update Task'
   visit tasks_path
   expect(page).to have_content('titles update')
   expect(page).to have_content('task update')
 end
 
 it "Validation does not pass if the titles is empty" do
  task = Task.new(titles: '', content: 'Failure test')
  expect(task).not_to be_valid
end
it "Validation does not pass if content is empty" do
  task = Task.new(titles: 'web', content: '')
  expect(task).not_to be_valid
end
it "validation passes If content is described in title and content" do
 
 visit  new_task_path
 fill_in  'Titles' ,  with: 'Test Titles'
 fill_in  'Content' ,  with: 'test'
  click_on 'Create Task'
  # task = Task.new(title: 'Test', content: 'Failure test')
  expect(page).to have_text('Task was successfully created.')
end

end