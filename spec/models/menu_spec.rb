require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name and a description' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'is invalid without a name' do
    menu = FactoryBot.build(:menu, name: nil)
    menu.valid?

    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    menu = FactoryBot.build(:menu, description: nil)
    menu.valid?

    expect(menu.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    menu1 = FactoryBot.create(:menu, name: 'Nasi')
    menu2 = FactoryBot.build(:menu, name: 'Nasi')
    menu2.valid?

    expect(menu2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid when a price is lower than 0.01' do
    menu = FactoryBot.build(:menu, price: 0.001)
    menu.valid?

    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it 'is invalid when a description bigger than 150 character' do
    random_character = (0...160).map { ('a'..'z').to_a[rand(26)] }.join

    menu = FactoryBot.build(:menu, description: random_character)
    menu.valid?

    expect(menu.errors[:description]).to include("is too long (maximum is 150 characters)")
  end
end
