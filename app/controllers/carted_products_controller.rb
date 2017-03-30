class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    if @carted_products.length > 0
    # same thing ==> @carted_products = current_user.carted_products.where(status: "carted")
      render "index.html.erb"
    else 
      flash[:warning] = "you have no stays lined up"
      redirect_to "/"
    end
  end

  def create
    @carted_product = CartedProduct.new(
      quantity: params[:form_quantity],
      user_id: current_user.id,
      product_id: params[:form_product_id],
      status: "carted"
     )
    @carted_product.save
    redirect_to "/carted_products"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    redirect_to "/carted_products"
  end
end

