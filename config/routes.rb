Rails.application.routes.draw do
  # get 'members/show'
  devise_for :clients
  devise_for :nutritionists, controllers: {
    sessions: 'nutritionists/sessions',
    registrations: 'nutritionists/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/member', to: 'members#show'
end
