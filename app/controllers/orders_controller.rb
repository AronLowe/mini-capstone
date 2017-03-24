class OrdersController < ApplicationController

  def create
    order = Order.new(
      quantity: params[:form_quantity],
      user_id: current_user.id,
      product_id: params[:form_product_id]
     )
    order.save
    order.subtotal = order.calc_subtotal
    order.total = order.calc_total 
    order.tax = order.calc_tax
    order.save
    flash[:success] = "Enjoy your stay"
    redirect_to "/orders/#{order.id}"
  end

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
  end

end
