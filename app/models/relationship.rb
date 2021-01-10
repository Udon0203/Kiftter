class Relationship < ApplicationRecord
  # 引用コード
  # UMAwweb1 Rails フォローフォロワー機能を作る　https://umaweb1.hatenablog.com/entry/2019/10/26/120623
  belongs_to :user
  belongs_to :follow, class_name: "User"

  validates :user_id, presence: true
  validates :follow_id, presence: true
end
