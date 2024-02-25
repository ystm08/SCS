# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [
  {id: 1, name: "Fashion"},
  {id: 2, name: "Nail"},
  {id: 3, name: "Cosmetics"}
]

categories.each do |category|
  Category.find_or_create_by!(category)
end

Admin.find_or_create_by!(email: "zz@zz") do |admin|
  admin.password = "111111"
end

user1 = User.find_or_create_by!(email: "user1@example.com") do |user|
  user.name = "五十嵐由香"
  user.name_kana = "いがらしゆか"
  user.password = "111111"
  user.phone_number = "08026084634"
  user.post_code = "1922023"
  user.address = "東京都葛飾区亀有1-1-5ビューハイツ706"
  user.user_name = "yuka.i"
  user.introduction = "Japan,Tokyo,99 (23)"
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

user2 = User.find_or_create_by!(email: "user2@example.com") do |user|
  user.name = "渡辺裕美"
  user.name_kana = "わたなべゆみ"
  user.password = "111111"
  user.phone_number = "08017675588"
  user.post_code = "1561159"
  user.address = "大阪府交野市妙見東1-1-16"
  user.user_name = "yumi..."
  user.introduction = "カフェ ふく おしゃべり お酒 旅行 #おしゃれさんと繋がりたい"
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

user3 = User.find_or_create_by!(email: "user3@example.com") do |user|
  user.name = "小島 玲奈"
  user.name_kana = "こじまれな"
  user.password = "111111"
  user.phone_number = "05074743756"
  user.post_code = "1647053"
  user.address = "宮城県仙台市宮城野区扇町2-1-11ドルチェヴィータ511"
  user.user_name = "reeeena"
  user.introduction = "1995️｜CBR250R｜Fashion｜Coffee｜trip"
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end