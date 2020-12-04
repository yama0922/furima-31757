FactoryBot.define do
  factory :user do
    nickname        { 'test' }
    email           { Faker::Internet.free_email}
    password        { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end
