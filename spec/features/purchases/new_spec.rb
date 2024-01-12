require 'rails_helper'

RSpec.describe 'Testing Purchase#new, it should', type: :feature do
  before :each do
    user = User.create(name: 'Salt', email: 'salt@example.com', password: 'password')
    @groups = [
      Group.create(name: 'Category 1', icon: 'icon1.png', user: user),
      Group.create(name: 'Category 2', icon: 'icon2.png', user: user)
    ]
    sign_in user
    visit new_group_purchase_path(@groups.first)
  end

  it 'display a form with several options' do
    expect(page).to have_field('Transaction Name')
    expect(page).to have_field('Amount')
    @groups.each do |group|
      expect(page).to have_unchecked_field(group.name)
    end
  end

  it 'fill in the form with valid attributes' do
    fill_in 'Transaction Name', with: 'Example Transaction'
    fill_in 'Amount', with: '100'
    @groups.each do |group|
      check group.name
    end
    click_button 'Create Transaction'

    expect(page).to have_current_path(group_purchases_path(@groups.first))
    expect(page).to have_content('Example Transaction')
  end
end