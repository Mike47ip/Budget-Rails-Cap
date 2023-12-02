require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:group_users) }
    it { is_expected.to have_and_belong_to_many(:entities) }
  end

  describe 'icon attachment' do
    it { is_expected.to have_one_attached(:icon) }
  end
end
