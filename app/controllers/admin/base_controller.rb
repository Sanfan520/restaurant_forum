class Admin::BaseController < ApplicationController
  # 這個 Controller 繼承 ApplicationController 所以可以用自己與 Application 的 method
  # 這裡的 namespace controller 在全部繼承這個Base controller 就可以使用這裡的 method了！
  before_action :authenticate_admin
  #驗證該 User 身份是否為網站管理員

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
