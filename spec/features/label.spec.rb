require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Label management function", type: :feature do
#  # In scenario (alias of it), write the processing of the test for each item you want to check
 background  do
   User.create!(name: "margo", email: 'm@gmail.Com',  password: '1234567')
     visit  root_path
    
      fill_in  'Email',  with: 'm@gmail.Com'
    
    # find('email', match: :first).set('m@gmail.com')
    
    fill_in  'Password' ,  with: '1234567'
    
    click_on  'Log in'
    
  expect(page).to have_text('')
   
end

 it "Validation does not pass if the description is empty" do
   task = Label.new(name: 'welcome', description: '')
   expect(task).not_to be_valid
 end
 it "Validation does not pass if name is empty" do
    if has_field?('name')
        fill_in  'name' ,  with: 'welcome'
    end
label = Label.new(name: '', description: 'label1')
   expect(label).not_to be_valid
 end

 it "validation passes If name and description are available" do
 
  visit  new_task_path
  if has_field?('name')
  fill_in  'Name' ,  with: 'welcome'
  fill_in  'description' ,  with: 'label1'
   click_on 'Post a new post'
   # task = Task.new(title: 'Test', content: 'Failure test')
   expect(page).to have_text('Label was successfully created.')
 end
end
 
 
 scenario "Test whether search button works" do
  visit  root_path
  if has_field?('email')
  fill_in  'Email',  with: 'm@gmail.Com'
   fill_in  'Password' ,  with: '1234567'
   click_on  'Log in'
   expect(page).to have_text('')
  
   Label.create(name: "web", description: "label1")
  
   fill_in  'term1',  with: 'welcome'
  
  click_on "Search"
  expect(page).to have_content('welcome')
   visit  new_task_path
 end
end
 end