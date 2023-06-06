# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'members/show'
  devise_for :clients, controllers: {
    sessions: 'clients/sessions',
    registrations: 'clients/registrations'
  }
  devise_for :nutritionists, controllers: {
    sessions: 'nutritionists/sessions',
    registrations: 'nutritionists/registrations'
  }

  get '/member', to: 'members#show'

  resources :nutritionists, only: %w[index show] do
    resources :recipes
    resources :meal_plans
    resources :ingredients
  end
  resources :clients, only: %w[index show]
end
