module Features
    module SessionHelpers
      def sign_up_with(email, password)
        visit sign_up_path
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        click_button 'Sign up'
      end
  
      def sign_in
        user = create(:user)
        visit sign_in_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign in'
      end
    end
    def current_user
      remember_token = User.digest(cookies[:remember_token])
      @current_user ||= User.find_by(remember_token: remember_token)
    end
  
    def current_user?(user)
      user == current_user
    end
  end