FactoryBot.define do
  factory :order_detail do
    association :order
    association :menu
    quantity { 2 }
    subtotal { 20000.0 }
    unit_price { 10000.0 }
  end
end
