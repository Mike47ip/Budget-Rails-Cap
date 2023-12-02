require 'rails_helper'

RSpec.feature 'Group Show', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group_with_user, user:) }

  before do
    login_as(user, scope: :user)
    visit group_path(group)
  end

  scenario 'User sees the group show page navigation' do
    within '.nav.background' do
      expect(page).to have_content(group.name)
      expect(page).to have_content('SIGN OUT')
    end
  end

  scenario 'User can navigate to add a new transaction from the group show page' do
    click_link 'Add a new transaction'
    expect(current_path).to eq(new_group_entity_path(group))
  end
end
