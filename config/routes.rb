Rails.application.routes.draw do
  resources :articles do 
    resources :rates, only: [:new,:create, :destroy]
  end
  namespace :admin do
    resources :articles
  end
  root to: "articles#index"
  devise_for :users
  resources :abroads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
