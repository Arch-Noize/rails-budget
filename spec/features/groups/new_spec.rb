require 'rails_helper'

RSpec.describe 'Testing Group#new, it should', type: :feature do
  before :each do
    user = User.create(name: 'Salt', email: 'salt@example.com', password: 'password')
    sign_in user
    visit new_group_path
  end

  it 'display a form with several options' do
    expect(page).to have_field('Category Name')
    expect(page).to have_field('Category Icon')
  end

  it 'fill in the form with valid attributes' do
    fill_in 'Category Name', with: 'Example Category'
    fill_in 'Category Icon', with: 'icon.png'
    click_button 'Create Category'
    expect(page).to have_current_path(groups_path)
    expect(page).to have_content('Example Category')
  end
end
