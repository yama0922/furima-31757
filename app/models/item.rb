class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sale_status
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery

  with_options presence: true do
   validates :text 
   validates :name
   validates :price
   validates :image
   validates :category
   validates :prefecture
   validates :sale_status
   validates :shipping_fee_status
   validates :scheduled_delivery
  end
  
  validates :category_id, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  validates :price, numericality: { with: /\A[a-zA-Z0-9]+\z/, message: '半角数字のみ入力可能である' }

  # 画像は1枚必須である(ActiveStorageを使用すること)
  # 商品名が必須である
  # 商品の説明が必須である
  # 価格についての情報が必須である
  # 価格の範囲が、¥300~¥9,999,999の間である
  # 販売価格は半角数字のみ入力可能である
  # category_id,sale_status_id,shipping_fee_status_id,prefecture_id,scheduled_delivery_idはidがの場合、値が-となっているため、1では保存できない
end
