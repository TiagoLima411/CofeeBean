# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'
  resources :members, only: %i[create show]

  get '/sessions/sign_up', to: 'sessions#sign_up'
  get '/sessions/sign_in', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
end
