Rails.application.routes.draw do
  resources :articles
  root to: "articles#index"
  devise_for :users
  get 'abroads/index'
  get 'abroads/new'
  get 'abroads/create'
  get 'abroads/show'
  get 'abroads/edit'
  get 'abroads/update'
  get 'abroads/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
