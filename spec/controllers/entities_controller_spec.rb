require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group_with_user, user:) }

  before { sign_in(user) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, params: { group_id: group.id }
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new, params: { group_id: group.id }
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates a new entity with valid parameters' do
      entity_params = attributes_for(:entity, user:, group_ids: [group.id])

      expect do
        post :create, params: { group_id: group.id, entity: entity_params }
      end.to change(Entity, :count).by(1)

      expect(response).to redirect_to(group_entities_path(group))
      expect(flash[:notice]).to eq('Transaction successfully created!')
    end
  end
end
