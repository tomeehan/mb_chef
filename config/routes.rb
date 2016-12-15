Rails.application.routes.draw do
  resources :staffs
  resources :ticks do
  	collection do 
  		match 'completed', :via => [:get]
  	end	
  end
  devise_for :users
  resources :tasks

  # match 'ticks/completed' => 'ticks#completed', :via => [:get],:as => 'completed_ticks'

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/home", :to => 'pages#home'
  get "/pricing", :to => 'pages#pricing'
  get "/about", :to => 'pages#about'
  get "/contact", :to => 'pages#contact'
  get "/privacy", :to => 'pages#privacy'
end
