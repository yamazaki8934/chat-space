Rails.application.routes.draw do
  devise_for :users
   resources :users
  get 'messages' => 'messages#index'
  get 'messages/new' => 'messages#new'
  root 'messages#index'
end
