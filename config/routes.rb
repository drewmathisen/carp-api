Rails.application.routes.draw do
  #company routes
  get "/companies" => "companies#index"
  post "/companies" => "companies#create"

  #user routes
  get "/users" => "users#index"
  post "/users" => "users#create"
  
end
