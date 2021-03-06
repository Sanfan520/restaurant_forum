class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]

 def index
    @users = User.all
 end

  def show
    @commented_restaurants = @user.commented_restaurants.uniq
    @favorited_restaurants = @user.favorited_restaurants
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end


  def update
   @user.update(user_params)
   redirect_to user_path(@user)
  end

  def friend_list
    @user = User.find(params[:id])
    @all_friends = @user.friends
  end

private

  def set_user
   @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

end
