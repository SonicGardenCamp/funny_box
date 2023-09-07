class Group < ApplicationRecord
  belongs_to :host_user, class_name: :User, foreign_key: :host_user_id
  has_many :user_group_relationships, dependent: :destroy
  has_many :users, through: :user_group_relationships
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 255 }
  validates :category, presence: true
  
  before_create do
    self.last_posted_at = Time.current if last_posted_at.blank?
  end

  
  CATEGORIES = %w(ぐるくん スポーツ 娯楽 レジャー 料理 ゲーム 映像作品 音楽 お酒 その他).freeze


  has_many :tag_group_relationships, dependent: :destroy
  has_many :tags, through: :tag_group_relationships

  def self.ransackable_attributes(auth_object = nil)
    %w[name id last_posted_at category]
  end

  # def self.ransackable_associations(auth_object = nil)
  #   %w[posts]
  # end

  def add_tag(name)
    tags.create!(name: name)
  end

  def save_and_participate(user)
    transaction do
      self.host_user_id = user.id
      self.users << user
      save!
    end
  end

  def host_user?(user)
    host_user_id == user.id
  end

  def participate(user)
    user_group_relationships.create!(user: user)
  end

  def leave(user)
    user_group_relationships.find_by(user: user)&.destroy
  end

  def participating?(user)
    user_group_relationships.exists?(user: user)
  end
end
