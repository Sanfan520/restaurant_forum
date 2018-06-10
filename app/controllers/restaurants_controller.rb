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

  #新增收藏紀錄
  def favorite
    @restaurant = Restaurant.find(params[:id]) #依params[:id]確認物件
    @restaurant.favorites.create!(user: current_user)#在favorites資料表上建立一筆新紀錄，並寫入restaurant_id 和user_id
    redirect_back(fallback_location: root_path)#導回上一頁
  end

   #移除收藏紀錄
   def unfavorite
     @restaurant = Restaurant.find(params[:id]) #依 params[:id]確認餐廳物件
     favorites = Favorite.where(restaurant: @restaurant, user: current_user)#根據餐廳物件和current_user 查詢出favorites 資料表的紀錄
     favorites.destroy_all##將相關的紀錄刪除
     redirect_back(fallback_location: root_path)#導回上一頁
   end

   def ranking
     @restaurants = Restaurant.order(favorites_count: :desc).limit(10)
   end

end
