require 'rails_helper'

RSpec.describe 'Testing Purchases#index, it should', type: :feature do
  before do
    user = User.create(name: 'Salt', email: 'salt@example.com', password: 'password')
    @group = Group.create(name: 'Category 1', icon: 'icon1.png', user: user)
    @purchases = [
      Purchase.create(name: 'Transaction 1', amount: 50.23, user: user, groups: [@group]),
      Purchase.create(name: 'Transaction 2', amount: 75.10, user: user, groups: [@group])
    ]
    sign_in user
    visit group_purchases_path(@group)
  end

  it 'display transactions with their details' do
    expect(page).to have_content("Transactions")

    within '#purchases' do
      @purchases.each do |purchase|
        expect(page).to have_content(purchase.name)
        expect(page).to have_content(purchase.amount)
        expect(page).to have_content(purchase.created_at.strftime("%d/%m/%Y"))
      end
    end
  end

  it 'allow adding a new transaction' do
    click_link 'New Transaction'
    expect(page).to have_field('Transaction Name')
  end

  it 'have a link to go back to categories' do
    expect(page).to have_link(href: '/categories')
  end
end