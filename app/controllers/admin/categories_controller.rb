class Admin::CategoriesController < ApplicationController
  #產生 Admin::CategoriesController 之後，請你立刻完成認證使用者權限的設定
  before_action :authenticate_admin
  #驗證該 User 身份是否為網站管理員
  before_action :set_category, only:[:update, :destroy]
#ApplicationController已經有authenticate_admin了，
#而Admin::CategoriesController繼承了ApplicationController所以就不用再定義一次authenticate_admin
 def index
  @categories = Category.all
   # 這裡是new or edit 的form所需要的值，如果有url有id就將form帶入edit，沒有就new。
  if params[:id]  #先判斷 params[:id] 是否存在，
   set_category#若存在，就使用 find 方法找出一個已存在的 Category 物件；
  else  #若不存在，就自行用 new 方法用新增一個空的 Category 物件
   @category = Category.new
  end
 end

#補充:要直接在category index表單上新增category,不需new.html.erb的view,故也不需特別用一個(def)new方法


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

  def update
    #@category  = Category.find(params[:id]) => 被set_category取代
    if @category.update(category_params)
      flash[:notice] = "category was sucessfully updated"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end
#按下update的時候其實是觸發了另外一次的request,所以在controller裡面是看不到上一次的變數的，
#故仍需輸入@category = Category.find(params[:id])

  def destroy
    #@category  = Category.find(params[:id]) => 被set_category取代
    @category.destroy
    flash[:alert] = "category was sucessfully deleted"
    redirect_to admin_categories_path
  end
private

 def category_params
  params.require(:category).permit(:name)
 end

 def  set_category
  @category = Category.find(params[:id])
 end

end
