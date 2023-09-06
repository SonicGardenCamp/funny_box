class User < ApplicationRecord
  has_many :user_group_relationships,  dependent: :destroy
  has_many :groups, through: :user_group_relationships
  has_many :posts, dependent: :destroy
  has_many :hosted_groups, class_name: :Group, foreign_key: :host_user_id, inverse_of: :host_user

  before_destroy :delete_host_groups
  
  attr_accessor :remember_token
  before_save { self.email = email.downcase.strip }
  validates :name,  presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続的セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    remember_digest
  end

  def session_token
    remember_digest || remember
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def delete_host_groups
    # ユーザーがホストとして関連付けられているグループを削除
    host_groups = Group.where(host_user_id: self.id)
    host_groups.destroy_all
  end
end
