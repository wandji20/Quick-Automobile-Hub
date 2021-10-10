Rails.application.routes.draw do
  post 'login', to: 'authentications#create'
  resources :users, only: [:create, :show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
