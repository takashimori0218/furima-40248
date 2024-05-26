Rails.application.routes.draw do
  devise_for :users
  post '/users/sign_up', to: 'devise/registrations#new'
  resources :users, only: [:index, :new]

<<<<<<< Updated upstream
  resources :items, only: [:new, :create, :index, :show, :update, :edit]
=======
  resources :items, only: [:new, :create, :index, :show, :edit]
>>>>>>> Stashed changes

  root 'items#index'
end
