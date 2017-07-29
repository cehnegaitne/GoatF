Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :events
  resources :chat_rooms, only: [:new, :create, :show, :index]
  get 'events/new'
  mount ActionCable.server => '/cable'
  
  root 'events#index'
end
