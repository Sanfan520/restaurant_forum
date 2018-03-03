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
      description: FFaker::Lorem.paragraph
    )
  end
    #要產生的 Restaurant 屬性清單裡沒有包含 image，因為 image 已經掛載成為 CarrierWave 的圖片上傳欄位

    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
end
