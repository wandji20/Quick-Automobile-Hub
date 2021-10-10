Rails.application.routes.draw do
  post 'login', to: 'authentications#create'
  get 'profile', to: 'users#show'
  put 'profile', to: 'users#update'
  delete 'profile', to: 'users#destroy'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
