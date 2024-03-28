FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    name_kana { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    post_code { Faker::Address.zip_code }
    address { Faker::Address.street_address }
    user_name { Faker::Lorem.characters(number: 5) }
  end
end