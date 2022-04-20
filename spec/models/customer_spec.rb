require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid with a name' do
    expect(FactoryBot.build(:category)).to be_valid
  end
end
