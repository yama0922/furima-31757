class MemoForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :buyer_id, :item_id, :user_id, :token

  # ③↑address_paramsで送られてくるものを全て指定してあげたい

  # ここにモデルに記述していたバリデーションの処理を書く
  # ②↓ひとまとめにする記述をおさらいして頂きたいです
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :item_id
    validates :user_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'をハイフンを入れて、半角数字で入力してください' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'にはハイフンを入れずに、10桁又は11桁の半角数字を使用してください' }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    AddressForm.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end
