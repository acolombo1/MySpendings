require 'rails_helper'

RSpec.describe 'Main page.', type: :feature do
  before do
    user = User.first
    sign_in(user)
    visit(categories_path)
  end

  it 'Shows Categories' do
    expect(page).to have_content('CATEGORIES')
    expect(page).to have_content('Restaurant')
    expect(page).to have_content('Income')
  end

  it 'Click on Add Category redirects to new category page' do
    click_button('Create NEW CATEGORY')
    expect(page).to have_current_path new_category_path
    expect(page).to have_content('NEW CATEGORY')
  end

  it 'Click on a category redirects to its movements' do
    click_link('Restaurant')
    expect(page).to have_current_path category_path(2)
    expect(page).to have_content('MOVEMENTS')
  end
end
