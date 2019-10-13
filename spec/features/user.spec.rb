require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'm@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''
    expect(page).to have_content('Sign in')
  end
  def sign_up_with(email, password)
    visit sign_up_path
    fill_in 'Email', with: "m@gmail.com"
    fill_in 'Password', with: "1"
    click_button 'Sign up'
    
    expect(page).to have_text('')
  end
end