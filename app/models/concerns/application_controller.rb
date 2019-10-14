class Admmin::ApplicationController < Admin::ActionController::Base
    protect_from_forgery with: :exception
    add_flash_types :danger, :info, :warning, :success

    def current_user 
        @current_user ||= User.where(id: session[:user_id]).first
    end
    helper_method :current_user
    def destroy
        @task = Task.find(params[:id])
        if current_user == @task.user
            @task.destroy
        end

        redirect_to tasks_path
end
end