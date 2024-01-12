require 'rails_helper'

RSpec.describe 'Testing Purchase model, it should', type: :model do
  it 'be valid with valid attributes' do
    user = User.create(name: 'Salt', email: 'salt@example.com', password: '123456')
    group = Group.create(name: 'Microverse', icon: 'icon.png', user: user)
    purchase = Purchase.new(name: 'ISA', amount: 20, user: user, groups: [group])
    expect(purchase).to be_valid
  end

  it 'not be valid without a name' do
    purchase = Purchase.new(amount: 20)
    expect(purchase).to_not be_valid
  end

  it 'not be valid without an amount' do
    purchase = Purchase.new(name: 'ISA')
    expect(purchase).to_not be_valid
  end

  it 'not be valid with a negative amount' do
    user = User.create(name: 'Salt', email: 'salt@example.com', password: '123456')
    group = Group.create(name: 'Microverse', icon: 'icon.png', user: user)
    purchase = Purchase.new(name: 'ISA', amount: -10, user: user, groups: [group])
    expect(purchase).to_not be_valid
  end
end