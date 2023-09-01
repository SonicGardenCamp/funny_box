class Group < ApplicationRecord
  has_many :user_group_relationships, dependent: :delete_all
  has_many :users, through: :user_group_relationships
  has_many :posts, dependent: :delete_all
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 255 }

  has_many :tag_group_relationships, dependent: :delete_all
  has_many :tags, through: :tag_group_relationships

end
