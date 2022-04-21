class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  validates :quantity, presence: true
  validates :subtotal, presence: true
  validates :unit_price, presence: true

  def sum_subtotal
    self.subtotal = self.unit_price * self.quantity
  end
end
