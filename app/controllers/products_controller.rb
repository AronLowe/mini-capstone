class ProductsController < ApplicationController
  def listings_method
    sort_attribute = params[:sort_by] || "name"
    @products=Product.all.order(sort_attribute)
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

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render "listings_destroy.html.erb"
  end

  def last_minute_deals
    @products = Product.where("price < ?", 1000)
    render "last_minute_deals.html.erb"
  end



end
