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

  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
