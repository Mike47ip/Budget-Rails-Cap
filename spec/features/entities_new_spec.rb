require 'rails_helper'

RSpec.feature 'Entities New', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group_with_user, user:) }

  before do
    login_as(user, scope: :user)
    visit new_group_entity_path(group)
  end

  scenario 'User sees the form for adding a new transaction' do
    expect(page).to have_selector('.nav.background')
    expect(page).to have_selector('.left-arrow-link.background')
    expect(page).to have_selector('.left-arrow.background')
    expect(page).to have_selector('.registration.background', text: 'ADD NEW TRANSACTION')
    expect(page).to have_selector('.background#next-btn', text: 'Save')

    within 'form' do
      expect(page).to have_selector('.custom-fieldsss', count: 2)
      expect(page).to have_selector('.custom-fieldss', text: 'Select Category')
      expect(page).to have_selector('button#next-btn-submit', text: 'Next', visible: :hidden)
    end

    expect(page).to have_link('Back to Transactions', href: group_entities_path(group), class: 'add-category-button')
  end
end
