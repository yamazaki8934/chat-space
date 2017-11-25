Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:index, :edit, :new, :update, :create] do
    resources :messages
  end
  root 'groups#index'
  devise_for :users
end
