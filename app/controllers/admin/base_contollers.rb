class Admin::BaseController < Admin::ApplicationController
before_filter :ensure_admin_user!

def ensure_admin_user!
    unless current_user and current_user.admin?
        redirect_to root_path, danger:  "you don't belong there"
    end 
end