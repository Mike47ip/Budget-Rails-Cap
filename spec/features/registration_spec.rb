require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  it 'displays the name field on the registration form' do
    visit new_user_registration_path
    expect(page).to have_field 'Full Name'
  end

  it 'displays the email field on the registration form' do
    visit new_user_registration_path
    expect(page).to have_field 'Email'
  end

  it 'displays the password field on the registration form' do
    visit new_user_registration_path
    expect(page).to have_field 'Password (6 characters minimum)'
  end

  it 'displays the password confirmation field on the registration form' do
    visit new_user_registration_path
    expect(page).to have_field 'Password confirmation'
  end

  it 'displays the "Next" button on the registration form' do
    visit new_user_registration_path
    expect(page).to have_content 'Next'
  end
end
