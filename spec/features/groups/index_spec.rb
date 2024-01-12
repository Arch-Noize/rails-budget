require 'rails_helper'

RSpec.describe 'Testing Group#index, it should', type: :feature do
  before do
    user = User.create(name: 'Salt', email: 'salt@example.com', password: 'password')
    @groups = [
      Group.create(name: 'Category 1', icon: 'icon1.png', user: user),
      Group.create(name: 'Category 2', icon: 'icon2.png', user: user)
    ]
    sign_in user
    visit groups_path
  end

  it 'display categories with their details' do
    expect(page).to have_content("Categories")

    within '#groups' do
      @groups.each do |group|
        expect(page).to have_content(group.name)
        expect(page).to have_selector("img[src$='#{group.icon}']")
        expect(page).to have_content(group.created_at.strftime("%d/%m/%Y"))
        expect(page).to have_content(group.total)
      end
    end
  end

  it 'allow adding a new category' do
    click_link 'New Category'
    expect(page).to have_field('Category Name')
  end

  it 'have a button to logout' do
    expect(page).to have_button('Logout')
  end
end