class Post < ApplicationRecord
  # 参考
  # progate Ruby on Rails5 https://prog-8.com/languages/rails5
  validates :user_id, { presence: true }
  validates :comment, { presence: true }

  def showuserinfo
    return User.find_by(id: self.user_id)
  end
end
