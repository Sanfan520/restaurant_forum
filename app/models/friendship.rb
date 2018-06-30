class Friendship < ApplicationRecord
  belongs_to :user
  #省略belongs_to :user, class_name: "User", foreign_key: "user_id", primary_key: "id"
  belongs_to :friend, class_name: "User", foreign_key: "friend_id", primary_key: "id"

  validates :friend_id, uniqueness: { scope: :user_id }
    # 每個user只能加另一個user做為朋友一次，從資料表角度而言 = 確保一筆資料底下 user_id底下僅有一個friend_id
end
