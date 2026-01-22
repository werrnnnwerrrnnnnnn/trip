Rails.application.routes.draw do
  root "home#index"

  # Public (normal users)
  resources :registrations, only: [:new, :create]

  # Admin area
  namespace :admin do
    resources :registrations, only: [:index, :edit, :update, :destroy]
  end

  resources :students

  # Health & PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end