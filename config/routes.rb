Rails.application.routes.draw do
  devise_for :users
  post '/users/sign_up', to: 'devise/registrations#new'
  resources :users, only: [:index, :new]

  resources :items, only: [:new, :create, :index, :show, :update, :edit]

  root 'items#index'
end
