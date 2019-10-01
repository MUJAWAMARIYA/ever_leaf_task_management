# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:admin?)
      can :access, :rails_admin
      can :manage, :all
    end
  end


    # Define abilities for the passed in user here. For example:
    #
    if current_user.admin?
      # Describe the process to be executed only when the admin column of current_user is true (= administrator)
      if user.admin?
            can :manage, :all
           else
             can :read, :all
           end
        
    end
    <% if current_user.try(:admin?) %>
    <h1>Blogs_admin</h1>
  <% else %>
    <h1>Blogs</h1>
  <% end %>ser ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
