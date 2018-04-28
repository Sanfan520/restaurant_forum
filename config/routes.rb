Rails.application.routes.draw do
 #Devise自動建立通往認證使用者的功能
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 #前台首頁
 resources :restaurants, only: [:index, :show]
 resources :categories,only: :show
 root "restaurants#index"

#後台功能:Restaurant CRUD & Categories CRUD以及後台首頁
namespace :admin do
  resources :restaurants
  resources :categories
  root "restaurants#index"
 end
end
