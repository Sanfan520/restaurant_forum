class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
 def authenticate_admin
   unless current_user.admin? #unless 會條件式回傳 False 時，才會去執行 block 裡的程式碼
    flash[:alert]= "Not allow!"
    redirect_to root_path
   end
 end

#current_user 是 Devise 提供的 helper method, 至於admin? 方法要到 app/model/user.rb手動建立
#透過 current_user 拿到 User instance，接著呼叫一個叫 admin? 的 instance method
#若 current_user.admin? 回傳 False，就將警告訊息寫入 flash method，跳回首頁並且顯示警告訊息。

# if !current_user.admin?  = unless current_user.admin? 
end
