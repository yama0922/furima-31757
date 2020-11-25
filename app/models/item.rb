class Item < ApplicationRecord
  belongs_to :user
  has_one :address_form
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sale_status
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery

  validates :text, presence: true
  validates :category_id, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 } 

end
