require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with a email ' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'is invalid when email is invalid format' do
    order = FactoryBot.build(:order, email: "halo@gigih")
    order.valid?

    expect(order.errors[:email]).to include("is invalid")
  end
end
