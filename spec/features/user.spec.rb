require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new(password: "some_password", email: "john@doe.com") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
#   describe "Associations" do
#     it { belong_to(:user) }
#     it { belong_to(:user) }
#   end
#   scenario "Test user creation" do
#     User.create!(name: "margo", email: 'm@gmail.Com',  password: '1234567')
#     visit  root_path
#    fill_in  'Email',  with: 'm@gmail.Com'
#    fill_in  'Password' ,  with: '1234567'
#    click_on  'Log in'
#  expect(page).to have_text('')
#     visit  user_path
#      fill_in  'Titles' ,  with: 'grettings'
#      fill_in  'Content' ,  with: 'testtesttest'
#      click_on 'Create user'
#      expect(page).to have_text('')
#    end
#    scenario "Test user details" do
#     visit  root_path
#     fill_in  'Email',  with: 'm@gmail.Com'
#    fill_in  'name',  with: 'mmmmm'
#      click_on  'details'
#      expect(page ).to have_text('')
    
    
#    end
end