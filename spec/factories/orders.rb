FactoryBot.define do
  factory :order do
    date_order { "20/04/2022" }
    email { "test@gmail.com" }
    total_price { 50000.0 }
    status { "NEW" }
  end

  factory :invalid_order, parent: :order do
    name { nil }
  end
end
