class User < ApplicationRecord
  # 参考コード
  # UMAwweb1 Rails フォローフォロワー機能を作る　https://umaweb1.hatenablog.com/entry/2019/10/26/120623
  # progate Ruby on Rails5 https://prog-8.com/languages/rails5
  has_secure_password

  validates :name, { presence: true }
  validates :email, { uniqueness: true }

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user

  def searchposts
    return Post.where(user_id: self.id).order(created_at: :desc)
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
