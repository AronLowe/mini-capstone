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

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "listings_show.html.erb"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "listings_edit.html.erb"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.price = params[:form_price]
    @product.image = params[:form_image]
    @product.description = params[:form_description]
    @product.save
    render "listings_update.html.erb"
  end


end
