class RestaurantsController < ApplicationController
  before_action :authenticate_user! #devise提供的方法，檢查從route送進來的request 是否來自一個已登入的使用者

  def index

  end
end
