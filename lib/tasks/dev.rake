namespace :dev do
#加上enviroment可以載入環境，載入專案的model 和資料庫，
#development（開發模式）：你的本機開發環境
#沒有加enviroment將只能在rake內寫普通的ruby
 task fake_restaurant: :environment do
   Restaurant.destroy_all #清除舊資料
   Comment.destroy_all



   50.times do |i|
       Restaurant.create!(name: FFaker::Name.first_name,
         opening_hours: FFaker::Time.datetime,
         tel: FFaker::PhoneNumber.short_phone_number,
         address: FFaker::Address.street_address,
         description: FFaker::Lorem.paragraph,
         category: Category.all.sample,
         image: File.open(File.join(Rails.root,"/public/img/#{rand(1..9)}.jpg"))
         )

         #使用 sample 方法從集合中自動挑出一個項目回傳，在這裡回傳的會是一個 Category instance。
         #傳入一個 Category instance 給 category_id 選項。
    end
    #要產生的 Restaurant 屬性清單裡沒有包含 image，因為 image 已經掛載成為 CarrierWave 的圖片上傳欄位

    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
 end

  task fake_user: :environment do
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
      name: "#{user_name}",
      email: "#{user_name}@yahoo.com.tw",
      intro: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua. Ut enim ad minim veniam",
      password: "123456",
      avatar: File.open(File.join(Rails.root,"/public/img/#{rand(1..7)}.png"))
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
end

  task fake_comment: :environment do
     Restaurant.all.each do |restaurant|
       3.times do |i|
         restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
          #  user: User.all.sample  就等於 user_id: User.all.sample.id
         )
      end
   end
   puts "have created fake comments"
   puts "now you have #{Comment.count} comment data"
  end

  task fake_user_following: :environment do
     User.all.each do |user|
      @users = User.where.not(id: user.id).shuffle  #where.not確保不會自己加自己好友
      5.times do
       user.followships.create!(
        following: @users.pop,
       )
      end
  end
  puts "have created user_following"
  puts "user successfully follow other 5 users"
  end
end
