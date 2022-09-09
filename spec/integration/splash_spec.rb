require 'rails_helper'

RSpec.describe 'Splash page.', type: :feature do
  before do
    sign_out(User.first)
    visit(root_path)
  end

  it 'Shows button for login and signup' do
    expect(page).to have_button('LOG IN')
    expect(page).to have_button('SIGN UP')
  end

  it 'Click on LOG IN redirects to login page' do
    click_button('LOG IN')
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'Click on SIGN UP redirects to sign up page' do
    click_button('SIGN UP')
    expect(page).to have_current_path(new_user_registration_path)
  end
end
