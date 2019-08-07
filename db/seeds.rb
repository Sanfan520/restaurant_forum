# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
#category model繼承了Active Record的方法，才能使用ruby語法destory_all來刪除所有資料

category_list = [
 { name: "Chinese food"},
 { name: "Japanese food"},
 { name: "Italien food"},
 { name: "Mexican food"},
 { name: "Vegetarian food"},
 { name: "American food"},
 { name: "Combinational food"},
#把category[:name]的資料塞進Category(name:) 裡面。
#category_list=["中式料理", "日本料理", ......]這樣會寫死，
#hash好處在於，未來仍可調整，ex: category_list =[ {"中式料理",200] ,["日本料理",300} ]
]

category_list.each do |category|
   Category.create( name: category[:name] )
end
#使用 each 一筆筆執行 category_list，並用 create 建立新資料。
# 用 category[:name] 拿出 Hash 裡的資料，傳給 create
# # ex: Category.create( name: "Chinese food" )

puts "Category created!"

# Default admin
User.destroy_all

User.create!(
  name: "Sandy",
  email: "sandy@gmail.com",
  password:"12345678",
  role: "admin",
  intro: "my name is sandy and i was born in taiwan in 1980, and I used to be a teacher ten years ago",
  avatar: File.open(File.join(Rails.root, "/public/img/3.png"))
  )
puts "Default admin created"
