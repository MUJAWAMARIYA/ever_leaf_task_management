require 'spec_helper'


RSpec.describe "SessionsController" do
  describe "GET /login" do
    it "load the login page" do
      get "/login"
      expect(last_response).to be_ok
    end
  end

  describe "POST :create" do
    let(:user) { build(:user)}
    let(:params) { attributes_for(:user)}

    it "stay on page if user is not found" do
      expect(User).to receive(:find_by_email).and_return(false)
      post 'sessions/create'
      expect(last_response).to be_ok
    end

    it "stay on login page if user is not confirmed" do
      user.confirmation = false
      expect(User).to receive(:find_by_email).and_return(user)
      post 'sessions/create'
      expect(last_response).to be_ok
    end

    it "stay on login page if user has wrong password" do
      user.confirmation = true
      user.password = "fake"
      expect(User).to receive(:find_by_email).and_return(user)
      post 'sessions/create', {:password => 'correct'}
      expect(last_response).to be_ok
    end

    it "redirects to home for confirmed user and correct password" do
      user.confirmation = true
      user.password = 'real'
      expect(User).to receive(:find_by_email).and_return(user)
      post 'sessions/create', {:password => 'real', :remember_me => false}
      expect(last_response).to be_redirect
    end
  end

  describe "GET /logout" do
    exit "empty the current session"
    exit "redirect to homepage if user is logging out"
  end
end