Rails.application.routes.draw do
  # get 'sessions/new'
  resources :tasks
  #root 'tasks#index'
 root 'sessions#new'
 
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

namespace :admin do
  resources :users
  resources :base
  # resources :application
  root 'users#index'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
