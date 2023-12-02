require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).with_foreign_key(:author_id) }
    it { is_expected.to have_and_belong_to_many(:groups) }
  end
end
