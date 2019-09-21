Rails.application.routes.draw do
  resources :tasks
  # root 'users#index'
  root 'tasks#index'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
