require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user' do
        expect do
          post users_path, params: { user: attributes_for(:user) }
        end.to change(User, :count).by(1)
      end

      it 'signs in the user' do
        post users_path, params: { user: attributes_for(:user) }
        expect(controller.current_user).to be_present
      end

      it 'redirects to the root path' do
        post users_path, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(users_path)
      end
    end
  end
end
