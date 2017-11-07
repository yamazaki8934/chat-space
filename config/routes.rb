Rails.application.routes.draw do
  devise_for :users
   resources :users
  root 'messages#index'
  get 'messages' => 'messages#index'
  get 'messages/new' => 'messages#new'
  get 'users' => 'users#show'
end
