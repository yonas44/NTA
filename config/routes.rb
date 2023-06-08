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

  resources :nutritionists, only: %w[show update] do
    resources :meal_plans do
      resources :recipes do
        resources :ingredients
      end
    end
  end

  resources :clients, only: %w[show] do
    resources :meal_plans, only: %w[index show]
  end
end
