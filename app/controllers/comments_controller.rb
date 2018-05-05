class CommentsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])#Comment 是屬於 Restaurant 的子資源,故要先確認餐廳物件
    @comment = @restaurant.comments.build(comment_params)#透過關聯建立一個新的評論
    @comment.user = current_user #確認關聯的使用者,目前的 Model 設定，還必須指定另一個關聯的外鍵 user_id,
    #current_user 是 Devise 定義的 helper method
    @comment.save!  #將評論存入資料庫內
     redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.find(params[:id])

    if current_user.admin?
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
   end
private

  def comment_params
    params.require(:comment).permit(:content)
  end


end
