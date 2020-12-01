Rails.application.routes.draw do
  resources :articles do 
    resources :rates, only: [:new,:create, :destroy]
  end
  namespace :admin do
    resources :articles
  end
  root "home#index"
  devise_for :users
  resources :abroads
  resources :users, only: [:show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
