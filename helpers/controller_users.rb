module ControllerUsers

  def login_as_admin
    admin = FactoryGirl.create(:user_admin)
    login_as(admin)
  end

  def login_as(user)
    request.session[:user_id] = user.id
  end

end