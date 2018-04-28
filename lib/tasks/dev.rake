namespace :dev do
#加上enviroment可以載入環境，載入專案的model 和資料庫，
#沒有加enviroment將只能在rake內寫普通的ruby
 task fake: :environment do
  Restaurant.destroy_all #清除舊資料

  50.times do |i|
    Restaurant.create!(name: FFaker::Name.first_name,
      opening_hours: FFaker::Time.datetime,
      tel: FFaker::PhoneNumber.short_phone_number,
      address: FFaker::Address.street_address,
      description: FFaker::Lorem.paragraph,
      category: Category.all.sample,
      image: File.open(Rails.root.join("seed_img/#{rand(1..9)}.jpg"))
      )

      #使用 sample 方法從集合中自動挑出一個項目回傳，在這裡回傳的會是一個 Category instance。
      #傳入一個 Category instance 給 category_id 選項。
  end
    #要產生的 Restaurant 屬性清單裡沒有包含 image，因為 image 已經掛載成為 CarrierWave 的圖片上傳欄位

    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
end
