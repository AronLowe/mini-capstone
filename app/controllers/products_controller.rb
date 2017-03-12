class ProductsController < ApplicationController
  def listings_method
    @products=Product.all
    render "listings.html.erb"
  end

  def new
    render "listings_new.html.erb"
  end

  def create
    product = Product.new(
      name: params[:form_name],
      price: params[:form_price],
      image: params[:form_image],
      description: params[:form_description]
      )
    product.save
    render "listings_create.html.erb"
  end


end
