FactoryBot.define do
  factory :memo_form do
    token { 'tok_321e8dbe8388244b11c68353363a' }
    postal_code { '810-0033' }
    prefecture_id { 2 }
    city { '福岡市中央区' }
    address { '小笹4丁目12-3' }
    building { 'レジデンスホテル' }
    phone_number { '09072837847' }
  end
end
