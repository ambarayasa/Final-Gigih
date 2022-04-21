class Order < ApplicationRecord
    has_many :order_details
    has_many :menus, through: :order_details

    validates :email, presence: true, format: { with: /\A([^\}\{\]\[@\s\,]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "is invalid" }
    validates :date_order, presence: true
    validates :status, presence: true

    def add_menu(menus)
        menus.each do |menu|
            if Menu.find_by_id(menu[:id])
                self.order_details << OrderDetail.new(menu_id: menu[:id], quantity: menu[:quantity], unit_price: Menu.find_by_id(menu[:id]).price)
            end
        end
    end

    def sum_subtotal
        self.order_details.each do |order_detail|
            order_detail.sum_subtotal
        end
    end

    def sum_total_price
        self.order_details.each do |order_detail|
          self.total_price = self.total_price + order_detail.subtotal
        end
    end
end
