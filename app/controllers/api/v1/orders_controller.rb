class Api::V1::OrdersController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_order, only: %i[ show edit update destroy paid ]
  
    def index
      @orders = Order.all
      @respond = []
  
      @orders.each do |order|
        @respond << {
          order: order,
          menus: order.menus
        }
      end
      
      render json: {
        orders: @respond
      }
    end
  
    def create
      @order = Order.new(order_params)
      @order.add_menu(menu_order_params[:menus])
      @order.sum_subtotal
      @order.sum_total_price
      @order.save
            
      render json: {
        order: @order,
        menus: @order.menus
      }
    end
  
    def update
      @order.update(order_params)
      
      render json: {
        order: @order,
        menus: @order.menus
      }
    end
  
    def show
      @order_detail = @order.order_details
      render json: {
        order: @order,
        menus: @order.menus
      }
    end

    def destroy
        @order.order_details.destroy_all
        @order.destroy
        render json: 200
    end

    def paid
        @order.change_status_paid
        render json: {
            order: @order,
            menus: @order.menus
        }
    end

    def canceled
        Order.change_status_canceled
        @order = Order.all
        render json: {
            order: @order
        }
    end
  
    private
  
    def order_params
      params.require(:order).permit(:email, :date_order)
    end
  
    def menu_order_params
      params.require(:order).permit(menus: [:id, :quantity])
    end
  
    def set_order
      @order = Order.find_by(id: params[:id])
    end
  end
  