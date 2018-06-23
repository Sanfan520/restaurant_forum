class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end
  #用 self 呼叫物件自己，而 self.role == "admin" 是一行陳述，如果 role 屬性等於 "admin"，該陳述就會回傳 True，否則將回傳 False。

# 「使用者評論很多餐廳」的多對多關聯
  has_many :comments, dependent: :restrict_with_error   # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :commented_restaurants, through: :comments, source: :restaurant

# 「使用者收藏很多餐廳」的多對多關聯
  # 「使用者收藏很多餐廳」的多對多關聯
  # 由於使用 restaurants 會和「使用者評論很多餐廳」重覆，將關聯名稱自訂為 :favorited_restaurants
  # 自訂名稱後，Rails 無法自動推論來源名稱，需另加 source 告知 model name
  has_many :favorites, dependent: :destroy
  has_many :favorites_restaurants, through: :favorites, source: :restaurant

  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :like, source: :restaurant

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

# 「使用者的追蹤者」的設定
 # 透過 class_name, foreign_key 的自訂，指向 Followship 表上的另一側
  has_many :inverse_followships, class_name: "Followships", foreign_key :"following_id"
  has_many :followers, through: :inverse_followships, source: :user

  def following?(user)
    self.followings.include?(user)
  end
end
