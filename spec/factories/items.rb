FactoryBot.define do
  factory :item do

    name { Faker::Lorem.characters(number: 15) }
    introduction { Faker::Lorem.characters(number: 30) }
    category_id {Faker::Number.between(from: 1, to: 3)}
    price { Faker::Number.between(from: 100, to: 999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('app/images/no_image.jpg'), filename: 'no_image.jpg')
    end
  end
end