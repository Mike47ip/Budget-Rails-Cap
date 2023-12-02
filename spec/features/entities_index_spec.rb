require 'rails_helper'

RSpec.feature 'Entities Index', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group_with_user, user:) }
  let!(:entities) { create_list(:entity, 3, user:) }

  before do
    login_as(user, scope: :user)
    visit group_entities_path(group)
  end

  scenario 'User sees the group name and transactions heading' do
    expect(page).to have_content("#{group.name} Transactions")
  end

  scenario 'User sees the total amount on the entities index page' do
    within '.category-total' do
      expect(page).to have_content('Total Amount')
      expect(page).to have_content("$#{group.entities.sum(:amount)}")
    end
  end

  scenario 'User sees the "Add a new transaction" link' do
    expect(page).to have_link('Add a new transaction', href: new_group_entity_path(group))
  end
end
