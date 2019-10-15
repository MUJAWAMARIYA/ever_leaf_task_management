# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "user management function", type: :feature do
# In scenario (alias of it), write the processing of the test for each item you want to check.
background do
  User.create!(name: "margo", email: 'margo@gmail.Com', title: 'admin',  password: '0000000')
  visit  root_path
  #click_on 'Login'
  fill_in  'Email' ,  with: 'margo@gmail.Com'
  fill_in  'Password' ,  with: '0000000'
  click_on  'Login'
end

scenario "Test number of users" do
  User.create!(name: 'margo', email: 'margo@gmail.com', title: 'admin', password: '0000000')
  @user = User.all.count
  expect(@user).to eq 2
end
scenario "Test user list" do
    User.create!(name: 'margo', email: 'margo@gmail.com', title: 'admin', password: '0000000')
  visit users_path
  expect(page ).to  have_content  'margo'
  expect(page ).to  have_content  'margo'
 end
scenario 'tries to view list of users on users index page' do
  visit users_path #try to enter to users index page
  expect(current_path).to eq users_path #check current path
  expect(page).to have_content 'margo' #check for User 1 from 'background'
  expect(page).to have_content 'margo' #check for User 2 from 'background'
end

scenario "Test user creation" do
  User.create!(name: 'margos', email: 'margos@gmail.com', title: 'admin', password: '0000000')
  visit users_path
  expect(page ).to  have_text 'margos'
end

scenario "Test user details" do
  @user= User.create!(name: 'margo', email: 'margo@gmail.com', title: 'admin', password: '0000000')
  visit user_path(id: @user.id)
  expect(page).to have_content('margo@gmail.com')
  expect(page).to have_content('admin')
end
scenario "Test user updating" do
  @user = User.first
  visit edit_user_path(id: @user.id)
  fill_in 'Name', with: 'name update'
  #fill_in 'Content', with: 'content update'
  click_on 'Create my account'
  visit users_path
  expect(page).to have_text('')
  #expect(page).to have_content('content update')
end
scenario 'Test user Deletion' do
  User.create!(name: 'margo', email: 'margo@gmail.com', title: 'admin', password: '0000000')
  @user = User.last
  @user.destroy
  # expect(page).to have_content('testtesttest')
  # click_on 'Destroy'
  visit users_path
  expect(page).not_to have_text('User was successfully deleted')
end
end