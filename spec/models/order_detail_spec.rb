require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  it 'will valid with a quantity, subtotal and unit_price' do
    expect(FactoryBot.build(:order_detail)).to be_valid
  end

  it 'will invalid without a quantity' do
    order_detail = FactoryBot.build(:order_detail, quantity: nil )
    order_detail.valid?

    expect(order_detail.errors[:quantity]).to include("can't be blank")
  end

  it 'will invalid without a subtotal' do
    order_detail = FactoryBot.build(:order_detail, subtotal: nil )
    order_detail.valid?

    expect(order_detail.errors[:subtotal]).to include("can't be blank")
  end

  it 'will invalid without a unit_price' do
    order_detail = FactoryBot.build(:order_detail, unit_price: nil )
    order_detail.valid?

    expect(order_detail.errors[:unit_price]).to include("can't be blank")
  end
end
