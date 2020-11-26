require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができる時' do
    it '' do
      expect(@item).to be_valid
    end
  end
  
  context '商品出品ができない時' do
    it "category_idが空では登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category_id can't be blank")
    end

    it "sale_status_idが空では登録できないこと" do
      @item.sale_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Sale_status_id  can't be blank")
    end

    it "shipping_fee_status_idが空では登録できないこと" do
      @item.shipping_fee_status_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping_fee_status_id  can't be blank")
    end

    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture_id  can't be blank")
    end

    it "scheduled_delivery_idが空では登録できないこと" do
      @item.scheduled_delivery_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled_delivery_id  can't be blank")
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
  
    it "textが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
  
    it "priceが299円以下であれば登録できないこと" do
      @item.price = 300
      @item.price = 299
      @item.valid?
      expect(@item.errors.[:item]).to include("は不正な値です")
    end
  
    it "priceが全角数字の場合登録できない" do
      @item.price = 111
      @item.price = １１１
      @item.valid?
      expect(@item.errors.[:item]).to include("は不正な値です")
    end
    
    it "imageが空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
    end
     
    it "priceが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  
  
  
  end
end