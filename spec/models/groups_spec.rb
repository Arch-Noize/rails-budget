require 'rails_helper'

RSpec.describe 'Testing Group model, it should', type: :model do
  it 'be valid with valid attributes' do
    user = User.create(name: 'Salt', email: 'salt@example.com', password: '123456')
    group = Group.new(name: 'Microverse', icon: 'icon.png', user:)
    expect(group).to be_valid
  end

  it 'not be valid without a name' do
    group = Group.new(icon: 'icon.png')
    expect(group).to_not be_valid
  end

  it 'not be valid without an icon' do
    group = Group.new(name: 'Microverse')
    expect(group).to_not be_valid
  end
end
