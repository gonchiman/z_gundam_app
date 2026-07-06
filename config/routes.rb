Rails.application.routes.draw do
  resources :users
  resource :session
  resources :passwords, param: :token
  resources :users
  root "home#index"

  get "home/index"
  resources :warship_mobile_suits, only: [:new, :create, :destroy]
  resources :pilot_assignments
  resources :mobile_suits
  resources :warships
  resources :crew_members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots or 500 if it does not.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker"

  # Defines the root path route ("/")
  # root "posts#index"
end
