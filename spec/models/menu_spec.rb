require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name and a description' do
    expect(FactoryBot.build(:menu)).to be_valid
  end
end
