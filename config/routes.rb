Rails.application.routes.draw do
  devise_for :users
  get 'abroads/index'
  get 'abroads/new'
  get 'abroads/create'
  get 'abroads/show'
  get 'abroads/edit'
  get 'abroads/update'
  get 'abroads/destroy'
  
  root to: "abroads#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
