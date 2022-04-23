class Api::V1::ReportsController < ApplicationController
    protect_from_forgery with: :null_session

    def report
        unless param(params).empty?
            orders = Order.where(nil)
            param(params).each do |key, value|
                orders = orders.public_send("filter_by_#{key}", value) if value.present?
            end
        else
            orders = Order.where(created_at: Date.today.all_day)
        end
            
        render json: {
            orders: orders
        }
    end

    def param(params)
        params.slice(:email, :start_price, :end_price, :start_date, :end_date)
    end
end