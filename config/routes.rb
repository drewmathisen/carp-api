Rails.application.routes.draw do
  #company routes
  get "/companies" => "companies#index"
  post "/companies" => "companies#create"

  #user routes
  get "/users" => "users#index"
  post "/users" => "users#create"

  #product routes
  get "/products" => "products#index"
  post "/products" => "products#create"

  #order routes
  get "/orders/:user_id" => "orders#index"
  post "/orders/:user_id" => "orders#create"
  get "/orders/:user_id/:id" => "orders#show"
end
