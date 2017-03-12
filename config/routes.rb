Rails.application.routes.draw do
  get "/listings" => "products#listings_method"
  get "/listings/new" => "products#new"
  post "/listings" => "products#create"
end

# name, price, image, description