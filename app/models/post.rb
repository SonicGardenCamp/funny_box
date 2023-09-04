class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # def self.ransackable_attributes(auth_object = nil)
  #   %w[created_at]
  # end

  def save_and_touch
    transaction do
      save!
      group.touch(:last_posted_at)
    end
  end
end
