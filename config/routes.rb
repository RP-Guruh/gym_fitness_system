Rails.application.routes.draw do
  resources :instructures
  resources :members
  resources :membership_packages
  resources :permissions
  resources :roles
  # FilePond endpoints
  post "filepond/fetch", to: "filepond#fetch"
  delete "filepond/remove", to: "filepond#remove"
  resources :attachment, only: [:create, :destroy]
  resources :employees
  resources :villages
  resources :districts
  resources :regencies
  resources :provinces
  resources :inventory_categories
  resources :product_categories
  resources :account_configurations, only: [:index, :new, :create, :edit, :update, :generate_new_password]
  get "account_configurations/generate_new_password" => "account_configurations#generate_new_password"

  get "get_city" => "member#cities_select"

  devise_for :users

  # START : CUSTOM ROUTES
  get "/profile/:id", to: "account_configurations#change_profile_and_password", as: :change_profile_password

  resources :account_configurations do
    member do
      put "update_profil"
      patch "update_profil"

      put "update_password"
      patch "update_password"
    end
  end
  # END : CUSTOM ROUTES

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get "/dashboard", to: "dashboard#index", as: :dashboard

  # frozen_string_literal: true

  # Filepond::Rails::Engine.routes.draw do
  #   # https://pqina.nl/filepond/docs/api/server/#fetch
  #   post "active_storage/fetch", to: "ingress#fetch"

  #   # https://pqina.nl/filepond/docs/api/server/#remove
  #   delete "active_storage/remove", to: "ingress#remove"
  # end
end
