require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  # include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }
  let(:group) { create(:group_with_user, user:) }

  before { sign_in(user) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get group_entities_path(group)
      expect(response).to be_successful

    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get new_group_entity_path(group)
      expect(response).to be_successful

    end
  end
end
