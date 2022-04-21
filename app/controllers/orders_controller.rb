class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @orders = Order.all
  end

  def new
    orders = Order.new(order_params)
    order.add_menu(menu_order_params[:menus])
  end

  def edit
  end

  def show
    @order_detail = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:email, :order_date)
  end

  def menu_order_params
    params.require(:order).permit(menus: [:id, :quantity])
  end

  def set_order
    @order = Order.find_by(id: params[:id])
  end
end
