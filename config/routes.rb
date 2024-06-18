# frozen_string_literal: true

Rails.application.routes.draw do
  resources :prestations
  root 'home#index'

  get 'offers', to: 'home#offers'

  resources :clients

  # Catch-all route for handling routing errors
  match '*path', to: 'application#not_found', via: :all

  
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
