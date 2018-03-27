class Admin::CategoriesController < ApplicationController
  #產生 Admin::CategoriesController 之後，請你立刻完成認證使用者權限的設定
  before_action :authenticate_user!
  #驗證請求進入後台的是否為已登入的 User
  before_action :authenticate_admin
  #驗證該 User 身份是否為網站管理員

#ApplicationController已經有authenticate_admin了，
#而Admin::CategoriesController繼承了ApplicationController所以就不用再定義一次authenticate_admin
 def index
  @categories = Category.all
  @category = Category.new
  #要直接在category index表單上新增category,不需new.html.erb的view,故也不需特別用一個(def)new方法
 end

 def create
    @category = Category.new(category_params)
   if @category.save
    flash[:notice] = "category was sucessfully created"
    redirect_to admin_categories_path
   else
    @categories = Category.all
    render :index
  end
end
#else需加入categories = Category.all 原因:
#在create action裡面要求重新render index樣板，
#可以理解成:由"controller"中的create action走到"view"把index樣板(index.html.erb)render後，
#再傳送到使用者瀏覽器。這中間並沒有經過index action，不會有@categories的實例變數，所以要在render index前加入實例變數。

private

 def category_params
  params.require(:category).permit(:name)
 end


end
