FactoryBot.define do
  factory :user do
    nickname { "ばばちゃん" }
    password { "abcd1234"}
    email { Faker::Internet.email }
    lastname { "馬場" }
    firstname { "惇史郎" }
    lastname_kana { "ババ" }
    firstname_kana { "ジュンシロウ" }
    phone { "08012341234" }
    postcode { "111-1111" }
    prefecture_id { 1 }
    city { "世田谷区池尻４丁目"}
    address { "１−１" }
    building { "世田谷ハイツ２０４" }
  end
end
