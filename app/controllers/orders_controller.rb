class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_menu(menu_order_params[:menus])
  end

  def edit
  end

  def update
    @order.update(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order }
        format.json { render :index, status: :updated, location: @order }
      else
        format.html { render :edit, status: 422 }
        format.json { render json: @order.errors, status: 422 }
      end
    end
  end

  def show
    @order_detail = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:email)
  end

  def menu_order_params
    params.require(:order).permit(menus: [:id, :quantity])
  end

  def set_order
    @order = Order.find_by(id: params[:id])
  end
end
