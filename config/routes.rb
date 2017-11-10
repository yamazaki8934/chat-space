Rails.application.routes.draw do
  devise_for :users
   resources :users, only: [:edit, :update]
  get 'messages/new' => 'messages#new'
  root 'messages#index'
end
