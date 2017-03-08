Rails.application.routes.draw do
  get "/listings" => "pages#listings_method"
end
