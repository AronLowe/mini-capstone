class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  ###code comes from application controller  only admin can see certain pages
  
  def listings_method
    if params[:form_name]
      @products = Product.where("lower(name) LIKE?", "%" + params[:form_name].downcase + "%")
    elsif params[:last_minute] == "true"
      @products = Product.where("price < ?", 1000)
    elsif params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    else
    # if params[:sort_by]
    #   @products =  Product.all.order(params[:sort_by]=>params[:sort_order]) 
    #    else
    #   @products = Product.all
    # end
      sort_attribute = params[:sort_by] || "name"
      sort_attribute_order = params[:sort_order]  || "asc"
      @products =  Product.all.order(sort_attribute => sort_attribute_order) 
    end
    render "listings.html.erb"
  end

  def new
    # unless current_user && current_user.admin
    #   redirect_to '/'
    #   return
    # end
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
    # image = Image.new(
    #   url: params[:image],
    #   product_id: @product.id
    #   )
    # image.save
    ###still need to erase image from product model 
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

  # def last_minute_deals
  #   @products = Product.where("price < ?", 1000)
  #   render "last_minute_deals.html.erb"
  # end

  # def search
  #   @product= Product.where("name LIKE?", "%", + params[:form_name] + "%")
  #   render "listing.html.erb"
  # end



end
