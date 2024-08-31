Rails.application.routes.draw do
  resources :employees
  resources :villages
  resources :districts
  resources :regencies
  resources :provinces
  resources :inventory_categories
  resources :product_categories
  devise_for :users
  get 'dashboard/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  devise_scope :user do
    root to:  'devise/sessions#new'
  end

  get "/dashboard", to: "dashboard#index", as: :dashboard
end
