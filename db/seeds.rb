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

fashion1 = Item.find_or_create_by!(name: "Bag(Blue)") do |item|
  item.category_id = 1
  item.introduction = "ダックブルーのカラーが目を引く\r\nおしゃれなショルダーバッグです。\r\n\r\n女性らしいデザインで、さまざまなシーンで活躍し\r\n日常のコーディネートにアクセントを加えます。"
  item.price = "3500"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-fashion1.jpg"), filename:"sample-fashion1.jpg")
end

fashion2 = Item.find_or_create_by!(name: "Snake necklace(Gold)") do |item|
  item.category_id = 1
  item.introduction = "スタイリッシュなゴールドのスネークネックレスです。\r\nサージカルステンレスで錆びにくく、長く愛用できます。"
  item.price = "1800"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-fashion2.jpg"), filename:"sample-fashion2.jpg")
end

fashion3 = Item.find_or_create_by!(name: "High heels(Black)") do |item|
  item.category_id = 1
  item.introduction = "エレガントなブラックのハイヒールパンプスです。\r\n上品なデザインと高いヒールが女性らしさを引き立てます。\r\n仕事やパーティーなど様々なシーンで活躍する一足です。"
  item.price = "5000"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-fashion3.jpg"), filename:"sample-fashion3.jpg")
end

nail1 = Item.find_or_create_by!(name: "Nail polish") do |item|
  item.category_id = 2
  item.introduction = "爪を華やかに彩るネイルポリッシュです。\r\n簡単に塗布でき、速乾性があります。\r\nデイリーユースからパーティーシーンまで幅広くお使いいただけます。"
  item.price = "1200"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-nail1.jpg"), filename:"sample-nail1.jpg")
end

nail2 = Item.find_or_create_by!(name: "Nail(Black)") do |item|
  item.category_id = 2
  item.introduction = "高発色なネイルポリッシュです。\r\n濃密な発色と艶やかな仕上がりが特長で、\r\n手元をエレガントに演出します。\r\nパーティーシーンや特別な日に最適です。"
  item.price = "1500"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-nail2.jpg"), filename:"sample-nail2.jpg")
end

nail3 = Item.find_or_create_by!(name: "Gel nails") do |item|
  item.category_id = 2
  item.introduction = "長持ちするジェルネイルです。\r\n豊富なカラーバリエーションで\r\nお好みのカラーをお選びいただけます。\r\n自宅で簡単にセルフネイルが楽しめます。"
  item.price = "1800"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-nail3.jpg"), filename:"sample-nail3.jpg")
end

cosmetic1 = Item.find_or_create_by!(name: "Beauty serum") do |item|
  item.category_id = 3
  item.introduction = "潤いを与えながら肌を引き締める美容液です。\r\n\r\nヒアルロン酸やコラーゲンなどの保湿成分が\r\n肌に潤いを与え、ハリと弾力をサポートします。\r\n\r\n日々のスキンケアにおすすめのアイテムです。"
  item.price = "2800"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cosmetic1.jpg"), filename:"sample-cosmetic1.jpg")
end

cosmetic2 = Item.find_or_create_by!(name: "Lipstick") do |item|
  item.category_id = 3
  item.introduction = "しっとりしたテクスチャーで唇にぴったり密着し、\r\n美しいマットな仕上がりを演出する\r\nベルベットマットリップスティックです。\r\n\r\n豊富なカラーバリエーションから\r\nお気に入りの色を見つけてください。"
  item.price = "1600"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cosmetic2.jpg"), filename:"sample-cosmetic2.jpg")
end

cosmetic3 = Item.find_or_create_by!(name: "Eye shadow") do |item|
  item.category_id = 3
  item.introduction = "自然な仕上がりを楽しめるシルキーアイシャドウです。\r\n滑らかなテクスチャーで\r\n肌になじみやすく長時間持続します。"
  item.price = "800"
  item.item_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cosmetic3.jpg"), filename:"sample-cosmetic3.jpg")
end

review1 = Review.find_or_create_by!(content: "今日は素敵なネイルポリッシュを新しく買いました！\r\n久しぶりにおうちネイル出来て楽しかった💅") do |review|
  review.user_id = 1
  review.category_id = 2
  review.review_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review1.jpg"), filename:"sample-review1.jpg")
end

review2 = Review.find_or_create_by!(content: "最近化粧ノリいい〜大満足🙆") do |review|
  review.user_id = 2
  review.category_id = 3
  review.review_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review2.jpg"), filename:"sample-review2.jpg")
end

review3 = Review.find_or_create_by!(content: "次の予定が楽しみすぎて\r\n服だけ完成してしまった笑\r\nゴールドのスネークネックレスお気に入り🫶") do |review|
  review.user_id = 2
  review.category_id = 1
  review.review_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review3.jpg"), filename:"sample-review3.jpg")
end

review4 = Review.find_or_create_by!(content: "新しいアイシャドウを手に入れた！🫶\r\nこの色本当に素敵だし\r\nつけ心地も最高おすすめ！") do |review|
  review.user_id = 3
  review.category_id = 3
  review.review_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review4.jpg"), filename:"sample-review4.jpg")
end

review5 = Review.find_or_create_by!(content: "ネイルハマってしまってカラー買い揃えてる😂") do |review|
  review.user_id = 1
  review.category_id = 2
  review.review_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review5.jpg"), filename:"sample-review5.jpg")
end

review6 = Review.find_or_create_by!(content: "天気いいのでお散歩🙆💕\r\nこの前買った美容液の調子が良い!!") do |review|
  review.user_id = 2
  review.category_id = 3
  review.review_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review6.jpg"), filename:"sample-review6.jpg")
end

review7 = Review.find_or_create_by!(content: "めちゃくちゃ可愛い黒のパンプスGet!!\r\n可愛いは正義!!") do |review|
  review.user_id = 3
  review.category_id = 1
  review.review_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review7.jpg"), filename:"sample-review7.jpg")
end

reviews_items = [
  {id: 1, review_id: 1, item_id: 4},
  {id: 2, review_id: 2, item_id: 7},
  {id: 3, review_id: 3, item_id: 2},
  {id: 4, review_id: 4, item_id: 9},
  {id: 5, review_id: 4, item_id: 8},
  {id: 6, review_id: 5, item_id: 4},
  {id: 7, review_id: 5, item_id: 5},
  {id: 8, review_id: 5, item_id: 6},
  {id: 9, review_id: 6, item_id: 7},
  {id: 10, review_id: 7, item_id: 3},
  {id: 11, review_id: 7, item_id: 2},
]

reviews_items.each do |reviews_item|
  ReviewsItem.find_or_create_by!(reviews_item)
end