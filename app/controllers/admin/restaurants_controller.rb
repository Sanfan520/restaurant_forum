class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  def index
    @restaurants = Restaurant.all
  end
  #撈出來的整張restaurants table的資料，要存到變數裡才能操作
  #在rails裡，可以用Restaurant.all物件導向方法撈出資料
  #撈出來的資料需要存到變數才能操作,故拿到資料後，寫進@restaurants變數，把這個變數傳到view，利用erb把資料塞進html內

  def new
    @restaurant = Restaurant.new
  end
  #透過 Restaurant Model，呼叫 new 方法，產生一個物件實例，在 restaurants table 建立新的一列空資料。
  #建立new.html.erb樣板 =>將新建立的 @restaurant 送進 View 樣板 new.html.erb，讓使用者填寫表單
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
     redirect_to admin_restaurants_path

#當 @restaurant 被送進 Model，卻發現 @restaurant.name 沒有內容時，Model 會將物件退回 Controller，
#同時將錯誤訊息的提示字串存進 @restaurant.errors 裡=> 將 @restaurant.errors 的內容寫在new.html.erb中
    else
     flash.now[:alert] = "restaurant was falied to create due to lack of the name"
     render :new
    end
  end


   private

   def restaurant_params
     params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
   end
end
#你必須將寫入參數的程序，從 new action 裡獨立出來，宣告成另一個私有方法。這裡依慣例命名為 restaurant_params。
#使用 params 取出從 Client 端送進的 Request 裡，Controller 所需參數。
#使用 require(:object_name) 拿出表單資料。
#使用 permit 允許指定的屬性資料傳件 Model。
# 接著到model加入驗證程序
