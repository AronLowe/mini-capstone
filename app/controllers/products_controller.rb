class ProductsController < ApplicationController
  def listings_method
    render listings.htm.erb
  end
end
