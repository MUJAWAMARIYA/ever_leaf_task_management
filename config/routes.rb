Rails.application.routes.draw do
  # get 'sessions/new'
  resources :tasks
  root 'tasks#index'
 #root 'sessions#new'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
