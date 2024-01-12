require 'rails_helper'

RSpec.describe 'Testing User model, it should', type: :model do
  it 'be valid with valid attributes' do
    user = User.new(name: 'Salt', email: 'salt@example.com', password: '123456')
    expect(user).to be_valid
  end

  it 'not valid without a username' do
    user = User.new(email: 'salt@example.com')
    expect(user).to_not be_valid
  end

  it 'not be valid without an email' do
    user = User.new(name: 'Salt')
    expect(user).to_not be_valid
  end
end