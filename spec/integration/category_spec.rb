require 'rails_helper'

RSpec.describe 'Category page.', type: :feature do
  before do
    user = User.first
    sign_in(user)
    visit(category_path(2))
  end

  it 'Shows Title' do
    expect(page).to have_content('MOVEMENTS')
  end

  it 'Shows a total spendings of the category' do
    expect(page).to have_content('Restaurant')
    expect(page).to have_content('$48.10')
  end

  it 'Shows a movement' do
    expect(page).to have_content('Siga la Vaca')
  end

  it 'Click on Add Movement redirects to new movement page' do
    click_button('NEW MOVEMENT')
    expect(page).to have_current_path new_movement_path(2)
    expect(page).to have_content('NEW MOVEMENT')
    expect(page).to have_field('Category', with: Category.find(2).name)
  end
end
