Rails.application.routes.draw do
  resources :events
  resources :users
  get '/events/:id/invitations/new', to: 'invitations#new', as: 'new_invitation'
  post '/events/:id/invitations/new', to: 'invitations#create'

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  root 'events#index'
end
