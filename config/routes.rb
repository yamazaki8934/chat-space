Rails.application.routes.draw do
  devise_for :users
  get 'messages' => 'messages#index'
  root 'messages#index'
end