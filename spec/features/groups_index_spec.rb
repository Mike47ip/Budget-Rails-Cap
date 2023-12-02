require 'rails_helper'

RSpec.describe 'Groups Index', type: :feature do
  let!(:user) { create(:user) }
  let!(:group) { create(:group_with_user) }

  before do
    login_as(user, scope: :user)
    visit groups_path
  end

  it 'displays the page title "CATEGORIES"' do
    expect(page).to have_content 'CATEGORIES'
  end

  it 'contains a "SIGN OUT" button linking to the sign-out action' do
    expect(page).to have_link 'SIGN OUT', href: destroy_user_session_path
  end

  it 'contains an "Add New Category" button linking to the new group page' do
    expect(page).to have_link 'Add New Category', href: new_group_path
  end
end
