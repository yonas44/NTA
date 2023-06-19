# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }
  
  resources :users, only: %w[show update destroy]
  resources :recipes
  resources :ingredients
  resources :daily_meals
  resources :meal_plans
end
