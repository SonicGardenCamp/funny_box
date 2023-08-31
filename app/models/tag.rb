class Tag < ApplicationRecord
  has_many :tag_group_relationships
  has_many :groups, through: :tag_group_relationships

end
