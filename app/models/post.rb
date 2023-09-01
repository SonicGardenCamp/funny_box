class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def self.ransackable_attributes(auth_object = nil)
    %w[content created_at]
  end
end
