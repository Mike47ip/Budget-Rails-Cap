require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all groups to @groups' do
      group = create(:group)
      get :index
      expect(assigns(:groups)).to eq([group])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('groups/index')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user' do
        expect do
          post :create, params: { user: attributes_for(:user) }
        end.to change(User, :count).by(1)
      end

      it 'signs in the user' do
        post :create, params: { user: attributes_for(:user) }
        expect(controller.current_user).to be_present
      end

      it 'redirects to the root path' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
