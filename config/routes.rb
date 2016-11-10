Rails.application.routes.draw do
  resources :ticks
  devise_for :users
  resources :tasks

  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
