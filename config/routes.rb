Rails.application.routes.draw do
  resources :comments
  resources :dogs
  resources :owners
  resources :walkers
  root 'welcome#index'
  get '/login' => 'sessions#new', :as => :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', :as => :logout
end
