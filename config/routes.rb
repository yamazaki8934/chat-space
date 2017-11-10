Rails.application.routes.draw do
  devise_for :users
   resources :users, only: [:edit, :update]
   resources :messages, only: [:index, :new]
   resources :groups, only: [:edit, :new]
  root 'messages#index'
end
