Rails.application.routes.draw do
  get "/listings" => "products#listings_method"
  get "/listings/new" => "products#new"
  post "/listings" => "products#create"
  get "/listings/last_minute_deals" =>"products#last_minute_deals"
  get "/listings/:id" => "products#show"
  get "/listings/:id/edit" => "products#edit"
  patch "/listings/:id" => "products#update"
  delete "/listings/:id" => "products#destroy"
end

