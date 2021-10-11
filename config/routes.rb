Rails.application.routes.draw do
  get 'cars/index'
  get 'cars/show'
  get 'cars/update'
  get 'cars/destroy'
  post 'login', to: 'authentications#create'
  get 'profile', to: 'users#show'
  put 'profile', to: 'users#update'
  delete 'profile', to: 'users#destroy'
  resources :cars, only: [:create, :show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
