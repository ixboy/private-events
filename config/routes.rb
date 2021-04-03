Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'password', to: 'passwords#edit', as: :edit_password
  patch "password", to: "passwords#update"
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'
  get "sign_in", to: 'sessions#new'
  post "sign_in", to: 'sessions#create'
  root 'main#index'
end
