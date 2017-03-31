class OrdersController < ApplicationController
  before_action :authenticate_user!
##refactoring is in peters commits --- very worth it to look at as calc logic shouldnt live in controller
  def create
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    @subtotal = 0

    @carted_products.each do |carted_product|
      @subtotal = @subtotal + (carted_product.product.price * carted_product.quantity)
    end 

    @tax = @subtotal * 0.09
    @total = @subtotal + @tax

    order = Order.new(
        user_id: current_user.id,
        subtotal: @subtotal,
        tax: @tax,
        total: @total
      )
    # order = Order.new(
    #   quantity: params[:form_quantity],
    #   user_id: current_user.id,
    #   product_id: params[:form_product_id]
    #  )
    # order.save
    # order.subtotal = order.calc_subtotal
    # order.total = order.calc_total 
    # order.tax = order.calc_tax

    order.save
    # @carted_products.each do |carted_product|
    #   carted_product.update(
    #     order_id: order.id,
    #     status: "purchased")
    # end  *****same as below

    @carted_products.update_all(status: "purchased", order_id: order.id)

    flash[:success] = "Enjoy your stay"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end

end
