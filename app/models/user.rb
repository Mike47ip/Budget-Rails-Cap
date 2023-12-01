class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :entities, foreign_key: :author_id

  has_many :group_users
  has_many :groups, through: :group_users

  has_and_belongs_to_many :groups, join_table: :group_users
end
