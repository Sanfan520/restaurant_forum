class FollowshipsController < ApplicationController
  def create
  #為 current_user 產生一筆追蹤記錄，要追蹤的人 id 是⋯⋯
  @followship = current_user.followships.build(following_id: params[:following_id])

  if @followship.save #如果通過 Model 驗證，成功儲存到資料庫裡，則導回同一頁，並顯示成功訊息
    flash[:notice] = "Successfully followed"
    redirect_back(fallback_location: root_path)

  else #如果驗證失敗，也導回同一頁，並將錯誤訊息顯示給使用者
    flash[:alert] = @followship.errors.full_messages.to_sentence
    redirect_back(fallback_location: root_path)
  end
 end

  def destroy
    @followship = current_user.followships.where(following_id: params[:id]).first
    @followship.destroy
    flash[:alert] = "followship destroyed"
    redirect_back(fallback_location: root_path)
  end
end
