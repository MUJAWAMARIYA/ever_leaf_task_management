class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:index]
  # before_action :self.admin
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
    
    @user = current_user
    redirect_to root_path, warning: "You are not authorized" unless @user.admin?
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
     if @user.id == current_user.id
       redirect_to admin_users_url, notice: "You can not delete signed in user"
       @admin = User.admin
     elsif @admin == 1
      redirect_to admin_users_url, notice: "Atleast one admin must remain!"
    else
      @user.destroy
      redirect_to admin_users_url, notice: 'User was successfully destroyed.'
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
     params.require(:user).permit(:name, :email, :password, :password_confirmation,:title)
   end
   
  def must_be_admin
    unless current_user && current_user.admin?
      redirect_to new_user_path, notice: "Some message"
    end
  end
  def check_user
    if current_user && current_user.title != "admin"
      redirect_to root_path, notice: "only admin can access this page"
    end
  end
  def set_user
    @user = User.find(params[:id])
  end

 end
 
 