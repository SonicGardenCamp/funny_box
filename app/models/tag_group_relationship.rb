class TagGroupRelationship < ApplicationRecord
  belongs_to :tag
  belongs_to :group
end
