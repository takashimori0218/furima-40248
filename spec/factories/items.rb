require 'faker'

FactoryBot.define do
  factory :item do
    title { "商品タイトル" }
    description { "商品の説明" }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_time_id { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
