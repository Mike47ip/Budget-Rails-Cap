require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get groups_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'assigns groups to current user' do
      get groups_path(user)
      expect(assigns(:groups)).to eq(user.groups)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get new_group_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new group to @group' do
      get new_group_path(user)
      expect(assigns(:group)).to be_a_new(Group)
    end
  end
end
