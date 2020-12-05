class Buyer < ApplicationRecord
  belongs_to :user
  has_one :address_form
  belongs_to :item
end
