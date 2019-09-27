#  class SessionsController < ApplicationController
#    def new
#   end

#    def create
#       user = User.find_by(email: params[:session][:email].downcase)
#       if user && user.authenticate(params[:session][:password])
#        session[:user_id] = user.id
#        redirect_to user_path(user.id)
#       else
#         flash[:danger] = 'Failed to login'
#        render 'new'
#       end
#    end
#    def destroy
#       session.delete(:user_id)
#      flash[:notice] = 'You logged out'
#     redirect_to new_session_path
#     end
#  end

#  <% flash.each do |key, value| %>
#         <%= content_tag(:div, value, class: "#{key}") %>
#      <% end %>
    
#      <% if logged_in? %>
#        <%= link_to "Logout", session_path(current_user.id), method: :delete %>
#      <% else %>
#        <%= link_to "Sign up", new_user_path %>
#        <%= link_to "Login", new_session_path %>
#     <% end %>