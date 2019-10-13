class UsersController < ApplicationController
  before_action :must_be_admin, only: :edit
  before_action :check_user, only: [:index]
  before_action :authorize_admin, only: :index
  def index
    @users = User.all
    if logged_in?
      render "admin/show"
    else
      render 'index'
    end
  end
  def new
    @user = User.new

  
  end
  def create
   
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path(@user.id)
    else
      render 'new'
    end
  end
 
  def show
    @user = User.find(params[:id])
    @admin = @user.name
  end
  def edit   
    @user= User.find(params[:id])   
  end   
   
  def update   
    @user= User.find(params[:id])   
    if @user.update_attributes(user_params)   
      flash[:notice] = 'user updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit user!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @user = User.find(params[:id])   
    if @user.delete   
      flash[:notice] = 'user deleted!'   
      redirect_to users_path   
    else   
      flash[:error] = 'Failed to delete this user!'   
      render :destroy   
    end   
  end   
   
  # we used strong parameters for the validation of params   
  # def user_params  
  #   params.require(:product).permit(:name, :email :password, :password_confirmation, :title)   
  # end   
   
# end  
def current_user
  User.find_by(id: session[:user_id])
end

def must_be_admin
  unless current_user && current_user.admin?
    redirect_to root_path, notice: "Some message"
  end
end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:title)
  end
  
  def must_be_admin
    unless current_user && current_user.admin?
      redirect_to new_user_path, notice: "Some message"
    end
  end
  def check_user
    if current_user.title != "admin"
      redirect_to tasks_path, notice: "only admin can access this page"
    end
  end
  def admin_user
    redirect_to(root_path) unless current_user && current_user.admin?
 end
end
 
 def require_admin
  if !current_user.admin
    if request.xhr?
      head :unauthorized # for asynchronous/api requests, if you want.
    else
      render 'access/no_access' and return # or whatever.
    end
  end
  end 
 