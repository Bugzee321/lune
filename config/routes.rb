# frozen_string_literal: true

# == Route Map
#

require 'sidekiq/web'

Rails.application.routes.draw do
  get 'actors/search'
  get 'movies/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  mount Sidekiq::Web => '/sidekiq'
  get '/movies', to: 'movies#index'
  get '/actors/search', to: 'actors#search', as: 'search_actors'

  # Defines the root path route ("/")
  # root "posts#index"
end
