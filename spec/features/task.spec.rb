require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
#  # In scenario (alias of it), write the processing of the test for each item you want to check
 background  do
   User.create!(name: "margo", email: 'm@gmail.Com',  password: '1234567')
     visit  root_path
    if has_field?('email')
      fill_in  'Email',  with: 'm@gmail.Com'
    end
    # find('email', match: :first).set('m@gmail.com')
    if has_field?('password')
    fill_in  'Password' ,  with: '1234567'
    end
    click_on  'Log in'
    
  expect(page).to have_text('')
   
end
scenario "Test task list" do
 
   visit  new_task_path
   if has_field?('title')
   fill_in  'Titles' ,  with: 'grettings'
   end
   if has_field?('content')
   fill_in  'Content' ,  with: 'testtest'
   click_on 'Create Task'
   expect(page).to have_content 'testtest'
end
end
 # visit to tasks_path (transition to task list page)
# visit tasks_path
 # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method
 scenario "Test task creation" do
 
  visit  new_task_path
  if has_field?('title')
   fill_in  'Titles' ,  with: 'grettings'
   fill_in  'Content' ,  with: 'testtesttest'
   click_on 'Create Task'
   expect(page).to have_text('Task was successfully created.')
 end
end
 scenario "Test task details" do
  #  visit  root_path
  #  fill_in  'Email',  with: 'm@gmail.Com'
  #  fill_in  'Password',  with: '1234567'
  #  click_on  'Log in'
  #  expect(page ).to have_text('')
  visit  new_task_path
  if has_field?('title')
   fill_in  'Titles' ,  with: 'grettings'
   fill_in  'Content' ,  with: 'test'
   click_on 'Create Task'
   
   expect(page).to have_text('test')
 end
end
 scenario 'task must be true' do
  
  visit  new_task_path
  if has_field?('title')
   fill_in  'Titles' ,  with: ' '
   fill_in  'Content' ,  with: 'test'
   click_on 'Create Task'
   expect(page).to have_text('1 error prohibited this task from being saved:')
 end
end
 scenario "Test whether tasks are arranged in descending order of creation date" do
 assert Task.order('created_at DESC')
 end
 it "Validation does not pass if the titles is empty" do
   task = Task.new(titles: '', content: 'Failure test',start_date: '10-03-2019', end_date: '13-03-2019')
   expect(task).not_to be_valid
 end
 it "Validation does not pass if content is empty" do
   task = Task.new(titles: 'web', content: '',start_date: '10-03-2019', end_date: '13-03-2019')
   expect(task).not_to be_valid
 end
 it "Validation does not pass if start_date_cannot_be_later_than_end_date " do
  task = Task.new(start_date: '1-02-2019', end_date: '20-05-2019')
  expect(task).not_to be_valid
end
 it "validation passes If content is described in titles and content" do
 
  visit  new_task_path
  if has_field?('title')
  fill_in  'Titles' ,  with: 'Test Titles'
  fill_in  'Content' ,  with: 'test'
   click_on 'Create Task'
   # task = Task.new(title: 'Test', content: 'Failure test')
   expect(page).to have_text('Task was successfully created.')
 end
end
 scenario "Test whether tasks are sorted by priority" do
 
   visit  new_task_path
  Task.create(titles: "web", content: "testtest", start_date: "10,12,2019",end_date: "12,12,2019", kind_of_task:"kkkk",priority:"medium",status: "done")
  Task.order("priority asc")
  
 end
 scenario "Test whether tasks are arranged by deadline" do
  
   visit  new_task_path
  Task.create(titles: "web", content: "testtest", start_date: "10,12,2019",end_date: "12,12,2019", kind_of_task:"kkkk",priority:"medium",status: "done")
  Task.order("end_date asc")
  
 end
 scenario "Test whether search button works" do
  visit  root_path
  if has_field?('email')
  fill_in  'Email',  with: 'm@gmail.Com'
   fill_in  'Password' ,  with: '1234567'
   click_on  'Log in'
   expect(page).to have_text('')
  
   Task.create(titles: "web", content: "testtest", start_date: "10,12,2019",end_date: "12,12,2019", kind_of_task:"kkkk",priority:"medium",status: "done")
  
   fill_in  'term',  with: 'web'
  
  click_on "Search"
  expect(page).to have_content('web')
   visit  new_task_path
 end
end
 end