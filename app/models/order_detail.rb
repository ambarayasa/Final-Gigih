class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  def sum_subtotal
    self.subtotal = self.unit_price * self.quantity
  end
end
