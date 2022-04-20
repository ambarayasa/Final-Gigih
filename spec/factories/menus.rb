FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { Faker::String.random(length: 150) }
    price { 10000.0 }
    association :category, factory: :category
  end
end