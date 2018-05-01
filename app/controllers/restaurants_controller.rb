class RestaurantsController < ApplicationController


 def index
  @restaurants = Restaurant.page(params[:page]).per(9)
  @categories = Category.all
 end

 def show
   @restaurant = Restaurant.find(params[:id])
   @comment = Comment.new #輸入框有使用到 @comment
 end
end
