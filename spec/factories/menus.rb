FactoryBot.define do
  category = Category.new(name: Faker::Food.ethnic_category)
  factory :menu do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { 10000.0 }
    category { category }
  end
end