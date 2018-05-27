class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
#把圖片上船器掛載到Restaurant model上面，到restaurant.rb使用mout_uploader方法掛上去
#mount_uploader :colume_name, ClassName
##欄位名稱為symbol型態,類別名稱為constant型態
  validates_presence_of :name
  #上一步private method 宣告restaurant_params方法後，會想要在model加入驗證步驟，
  #將name 欄位設定為必填。若使用者沒有填寫餐廳的名稱，就按下送出鈕，我們不會將這筆資料送入資料庫。
  belongs_to :category

  #當 Restaurant 物件被刪除時，順便刪除依賴的 Comment
  has_many :comments, dependent: :destroy

  # 「餐廳被很多使用者收藏」的多對多關聯
  # 將關聯名稱自訂為 :favorited_users
  # 自訂名稱後，Rails 無法自動推論來源名稱，需另加 source 告知 model name
  has_many :favorites, dependent: :destroy
  has_many :favorited_users,through: :favorites, source: :user
end
