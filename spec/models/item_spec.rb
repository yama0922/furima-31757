require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
it "category_idが空では登録できないこと" do
  @item.category_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Category_id can't be blank")
end

t "sale_status_idが空では登録できないこと" do
  @item.sale_status_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Sale_status_id  can't be blank")
end

t "shipping_fee_status_idが空では登録できないこと" do
  @item.shipping_fee_status_id  = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Shipping_fee_status_id  can't be blank")
end

t "prefecture_idが空では登録できないこと" do
  @item.prefecture_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Prefecture_id  can't be blank")
end

t "scheduled_delivery_idが空では登録できないこと" do
  @item.scheduled_delivery_id  = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Scheduled_delivery_id  can't be blank")
end