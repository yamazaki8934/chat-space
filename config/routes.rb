Rails.application.routes.draw do
  get 'messages' => 'messages#index'
  root 'messages#index'
end
