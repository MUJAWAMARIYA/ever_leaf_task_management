Rails.application.routes.draw do
  resources :tasks
  post 'search',  :on => :collection
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
