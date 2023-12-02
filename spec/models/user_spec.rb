require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:entities).with_foreign_key(:author_id) }
  it { is_expected.to have_many(:group_users) }
  it { is_expected.to have_and_belong_to_many(:groups).join_table('group_users') }

  it { is_expected.to validate_presence_of(:name) }
end
