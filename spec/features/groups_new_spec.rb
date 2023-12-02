require 'rails_helper'

RSpec.feature 'Group New', type: :feature do
  scenario 'User sees the new group form navigation' do
    user = create(:user)
    login_as(user, scope: :user)

    visit new_group_path

    within '.nav.background' do
      expect(page).to have_content('ADD NEW CATEGORY')
      expect(page).to have_content('Save')
    end
  end

  scenario 'User sees the new group form fields' do
    user = create(:user)
    login_as(user, scope: :user)

    visit new_group_path

    within 'form' do
      expect(page).to have_field('Name')
    end
  end
end
