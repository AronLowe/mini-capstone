Rails.application.routes.draw do
  get "/listings" => "products#listings_method"
  get "/listings/new" => "products#new"
  post "/listings" => "products#create"
  get "/listings/:id" => "products#show"
  #need to acheive this through a link _ need to fixe imaging
  get "/listings/:id/edit" => "products#edit"
  patch "/listings/:id" => "products#update"
end

