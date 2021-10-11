Rails.application.routes.draw do

  post 'login', to: 'authentications#create'
  get 'profile', to: 'users#show'
  put 'profile', to: 'users#update'
  delete 'profile', to: 'users#destroy'
  resources :ratings, only: [:create, :update]
  resources :sales, only: [:create, :show, :update, :destroy]
  resources :cars, only: [:create, :show, :update, :destroy]
  resources :hires, only: [:create, :show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
