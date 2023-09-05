class Tag < ApplicationRecord
  has_many :tag_group_relationships, dependent: :destroy
  has_many :groups, through: :tag_group_relationships

  def self.ransackable_attributes(auth_object = nil)
    %w[name, genre]
  end

end
