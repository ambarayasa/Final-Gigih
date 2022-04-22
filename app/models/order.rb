class Order < ApplicationRecord
    has_many :order_details
    has_many :menus, through: :order_details

    validates :email, presence: true, format: { with: /\A([^\}\{\]\[@\s\,]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "is invalid" }
    validates :date_order, presence: true
    validates :status, presence: true

    def add_menu(menus)
        if menus.nil?
            self.errors.add(:order, "at least have 1 menu")
            return
        end
        menus.each do |menu|
            if Menu.find_by_id(menu[:id]).present?
                self.order_details << OrderDetail.new(menu_id: menu[:id], quantity: menu[:quantity], unit_price: Menu.find_by_id(menu[:id]).price)
            else
                self.errors.add(:menu, "not exists")
            end
            self.errors.add(:order, "quantity at least 1 item") if menu[:quantity].to_i < 1
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

    def change_status_paid
        self.update(status: "PAID")
    end

    def self.change_status_canceled
        self.where(status: "NEW").update_all(status: "CANCELED")
    end
end
