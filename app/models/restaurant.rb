class Restaurant < ApplicationRecord
  validates_presence_of :name
  #上一步private method 宣告restaurant_params方法後，會想要在model加入驗證步驟，
  #將name 欄位設定為必填。若使用者沒有填寫餐廳的名稱，就按下送出鈕，我們不會將這筆資料送入資料庫。
end
