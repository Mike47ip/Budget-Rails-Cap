require 'rails_helper'

RSpec.describe 'Splash Screen', type: :feature do
  it 'contains a "LOG IN" button linking to the login page' do
    visit root_path
    expect(page).to have_link 'LOG IN', href: new_user_session_path
  end

  it 'contains a "SIGN UP" button linking to the registration page' do
    visit root_path
    expect(page).to have_link 'SIGN UP', href: new_user_registration_path
  end

  it 'does not display any errors on the splash screen' do
    visit root_path
    expect(page).not_to have_content 'Error'
  end
end
