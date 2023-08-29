class Group < ApplicationRecord
  has_many :user_group_relationships, dependent: :delete_all
  has_many :users, through: :user_group_relationships
end
