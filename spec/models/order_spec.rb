require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with a name and a description' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'is invalid without a date order' do
    order = FactoryBot.build(:order, date_order: nil )
    order.valid?

    expect(order.errors[:date_order]).to include("can't be blank")
  end

  it 'is invalid without a status' do
    order = FactoryBot.build(:order, status: nil )
    order.valid?

    expect(order.errors[:status]).to include("can't be blank")
  end

  it 'is invalid when email is invalid format' do
    order = FactoryBot.build(:order, email: "halo@gigih")
    order.valid?

    expect(order.errors[:email]).to include("is invalid")
  end
end
