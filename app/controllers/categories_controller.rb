class CategoriesController < ApplicationController

  def show
    @categories = Category.all #上方分類標籤列——所有的分類資料
    @category = Category.find(params[:id]) #被點擊的分類——特定一筆分類資料
    @restaurants = @category.restaurants.page(params[:page]).per(9)#和該分類關聯的餐廳資料
  end
end
