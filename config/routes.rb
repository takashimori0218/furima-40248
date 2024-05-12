Rails.application.routes.draw do
  resource :items
  root 'items#index'
end
