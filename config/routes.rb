Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/products", to:"products#index"
  get "/products/new", to:"products#new"
  post "/products", to:"products#create"
  get "/products/:id/edit", to:"products#edit", as: :edit
  patch "/products/:id", to:"products#update"
  get "/products/:id", to:"products#show", as: :product
end
