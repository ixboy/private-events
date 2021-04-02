Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  root 'main#index'
end
