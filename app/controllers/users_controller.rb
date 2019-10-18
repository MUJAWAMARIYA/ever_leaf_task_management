class UsersController < ApplicationController
  before_action :must_be_admin, only: [:edit]
  before_action :check_user, only: [:index]
 before_action :only_create_user_when_none_signed_in, only: [:new, :create]
  before_action :only_see_own_page, only: [:show]
  def index
    @users = User.all
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
      redirect_to edit_user_path(user)
    else   
      flash[:error] = 'Failed to edit user!'   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a product from database based on id   
  def destroy   
    @user = User.find(params[:id]) 
   if @user.tasks.present?
    Task.where(user_id: params[:id]).destroy_all
   end
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:title, :admin, :user_id)
  end
  
  def must_be_admin
    unless current_user && current_user.admin?
      redirect_to new_user_path, notice: "admin can make some update on his/her choice "
    end
  end
  def check_user
    if current_user && current_user.title != "admin"
      redirect_to root_path, notice: "only admin can access this page"
    end
  end
 

  def only_create_user_when_none_signed_in
    if current_user
      redirect_to tasks_path,  notice: "you can't create user when signed in"
    end
  end

  def only_see_own_page
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to users_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
 end
 
 