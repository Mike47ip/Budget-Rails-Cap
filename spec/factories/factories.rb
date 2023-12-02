require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :group do
    name { Faker::Company.name }

    factory :group_with_user do
      transient { user { create(:user) } }

      after(:create) do |group, evaluator|
        create(:group_user, group:, user: evaluator.user)
      end
    end
  end

  factory :group_user do
    association :user
    association :group
  end

  factory :entity do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }
    association :user

    factory :entity_with_group_user, parent: :entity do
      after(:create) do |entity|
        entity.groups << create(:group)
      end
    end
  end
end
