Rails.application.routes.draw do
  
  resources :newsletter_subscribers
  resources :blogs
  resources :makers
  resources :subscribers
  resources :staffs
  resources :ticks do
  	collection do 
  		match 'completed', :via => [:get]
  	end	
  end
  devise_for :users, controllers: { registrations: "registrations"}
  resources :tasks

  # match 'ticks/completed' => 'ticks#completed', :via => [:get],:as => 'completed_ticks'

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/home", :to => 'pages#home'
  get "/pricing", :to => 'pages#pricing'
  get "/about", :to => 'pages#about'
  get "/enterprise", :to => 'pages#enterprise'
  get "/privacy", :to => 'pages#privacy'
  get "/team", :to => 'pages#team'
  get "/support", :to => 'pages#support'
  get "/blog", :to => 'blogs#index'
end
