require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  it 'displays the email field on the login form' do
    visit new_user_session_path
    expect(page).to have_field 'Email'
  end

  it 'displays the password field on the login form' do
    visit new_user_session_path
    expect(page).to have_field 'Password'
  end
end
