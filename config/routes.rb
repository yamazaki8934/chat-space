Rails.application.routes.draw do
  devise_for :users
   resources :users, only: [:edit, :update]
   resources :groups, only: [:index, :edit, :new, :update, :create] do
     resources :messages
   end
  root 'groups#index'
end
