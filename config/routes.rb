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
      resources :daily_meals
    end
    resources :active_appointments, only: %w[index]
    resources :recipes
    resources :ingredients
  end
  
  resources :clients, only: %w[show update] do
    resources :active_appointments, only: %w[create show destroy]
    resources :meal_plans, only: %w[index show] do
      resources :daily_meals, only: %w[index]
    end
  end

  resources :meal_types, only: [:index]
end
