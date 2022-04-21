FactoryBot.define do
  factory :order_detail do
    order { nil }
    menu { nil }
    quantity { 1 }
    subtotal { 1.5 }
    unit_price { 1.5 }
  end
end
