class Api::OrdersController < ApplicationController
  def create
    order = Order.create(order_params)
    product = Product.find(params[:order][:product_id])
    order.items.create(product: product)
    render json: { order: order }, status: :created
  end

  private

  def order_params
    params[:order].permit(:user_id)
  end
end
