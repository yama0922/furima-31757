require 'rails_helper'

RSpec.describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができる時' do
    it '全てのカラムが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品ができない時' do
    it 'category_idが1では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'sale_status_idが1では登録できないこと' do
      @item.sale_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Sale status must be other than 1')
    end

    it 'shipping_fee_status_idが1では登録できないこと' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
    end

    it 'prefecture_idが1では登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'scheduled_delivery_idが1では登録できないこと' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
    end

    it 'nameが空では登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空では登録できないこと' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'priceが300円以下であれば登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが9,999,999円以上であれば登録できないことであれば登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが全角数字の場合登録できない' do
      @item.price = '１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range', 'Price 半角数字のみ入力可能である')
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'category_id空では登録できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end

    it 'sale_status_id空では登録できないこと' do
      @item.sale_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sale status can't be blank", 'Sale status is not a number')
    end

    it 'shipping_fee_status_id空では登録できないこと' do
      @item.shipping_fee_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", 'Shipping fee status is not a number')
    end

    it 'prefecture_idが空では登録できないこと' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end

    it 'scheduled_delivery_idが空では登録できないこと' do
      @item.scheduled_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", 'Scheduled delivery is not a number')
    end
  end
end
