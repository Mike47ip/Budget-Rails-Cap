require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns groups to current user' do
      get :index
      expect(assigns(:groups)).to eq(user.groups)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new group to @group' do
      get :new
      expect(assigns(:group)).to be_a_new(Group)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { attributes_for(:group) }

      it 'creates a new group' do
        expect do
          post :create, params: { group: valid_params }
        end.to change(Group, :count).by(1)
      end

      it 'creates a join record' do
        expect do
          post :create, params: { group: valid_params }
        end.to change(GroupUser, :count).by(1)
      end

      it 'redirects to groups_path' do
        post :create, params: { group: valid_params }
        expect(response).to redirect_to(groups_path)
      end
    end
  end
end
