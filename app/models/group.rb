class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_and_belongs_to_many :entities
  has_and_belongs_to_many :users, join_table: :entities_groups

  has_one_attached :icon
end
