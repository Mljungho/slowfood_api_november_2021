class Api::OrdersController < ApplicationController
  def create
    order = Order.create(order_params)
    render json: { order: order }, status: :created
  end

  private

  def order_params
    params[:order].permit(:user_id)
  end
end

