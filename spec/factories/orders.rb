FactoryBot.define do
  factory :order do
    date_order { "MyString" }
    email { "MyString" }
    total_price { 1.5 }
    status { "MyString" }
  end
end
