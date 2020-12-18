Rails.application.routes.draw do
  resources :articles do 
    resources :rates, only: [:new,:create, :destroy]
  end
  
  namespace :admin do
    resources :articles
  end
  
  root "home#index"
  devise_for :users,
    controllers: { registrations: 'registrations' }
  
  devise_scope :user do
    get 'registrations/:id/edit_password', to: 'registrations#edit_password', as: 'edit_password'
    put 'registrations/:id/update_password', to: 'registrations#update_password', as: 'update_password'
  end
  
  resources :abroads
  resources :users, only: [:show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  get "/article/article_ranking", to: 'articles#article_ranking'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
