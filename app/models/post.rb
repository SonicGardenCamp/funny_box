class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def save_and_touch
    transaction do
      save!
      group.touch(:last_posted_at)
    end
  end

  def deletable?(user)
    return true if group.host_user?(user)

    self.user_id = user.id
  end
end
