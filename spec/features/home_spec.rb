require 'rails_helper'

RSpec.describe 'Testing Pages#root, it should', type: :feature do
  before :each do
    visit root_path
  end

  it 'has the log in button' do
    expect(page).to have_content('LOG IN')
  end

  it ' has the sign up ' do
    expect(page).to have_content('SIGN UP')
  end
end
