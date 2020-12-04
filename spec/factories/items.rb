FactoryBot.define do
  factory :item do
    category_id             { 2 }
    price                   { 300 }
    text                    { 'test' }
    name                    { 'test' }
    sale_status_id          { 2 }
    shipping_fee_status_id  { 2 }
    prefecture_id           { 2 }
    scheduled_delivery_id   { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end
  end
end