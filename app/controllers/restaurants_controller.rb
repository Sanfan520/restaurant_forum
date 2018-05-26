class RestaurantsController < ApplicationController


 def index
  @restaurants = Restaurant.page(params[:page]).per(9)
  @categories = Category.all
 end

 def show
   @restaurant = Restaurant.find(params[:id])
   @comment = Comment.new #輸入框有使用到 @comment
 end

 #"餐廳最新動態"頁面功能
  def feeds
   @recent_restaurants = Restaurant.order(created_at: :desc).limit(10) #最新建立的 10 筆餐廳 - @recent_restaurants
   @recent_comments = Comment.order(created_at: :desc).limit(10)#最新建立的 10 筆評論 - @recent_comments
  end

  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

end
