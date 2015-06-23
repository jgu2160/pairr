Rails.application.routes.draw do
  resources :users
  root "dashboard#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
