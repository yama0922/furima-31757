require 'rails_helper'
describe MemoForm do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @memo_form = FactoryBot.build(:memo_form, user_id: user.id, item_id: item.id)
  end
  describe '商品購入' do
    context '商品購入がうまく行く時' do
      it 'token, user_id, item_id, postal_code, prefecture_id, city, address, building, phone_number, buyer_id が全て存在する' do
        expect(@memo_form).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @memo_form.building = ''
        expect(@memo_form).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'user_idが空' do
        @memo_form.user_id = ''
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空' do
        @memo_form.item_id = ''
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'クレカの情報が正しく入っていない（tokenが空)' do
        @memo_form.token = nil
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空' do
        @memo_form.postal_code = ''
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include("Postal code can't be blank", 'Postal code をハイフンを入れて、半角数字で入力してください')
      end
      it 'prefecture_idが未選択' do
        @memo_form.prefecture_id = 1
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'prefecture_idが空白' do
        @memo_form.prefecture_id = ''
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'cityが空' do
        @memo_form.city = ''
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空' do
        @memo_form.address = ''
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'numberが空' do
        @memo_form.phone_number = ''
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeにハイフンが入っていない' do
        @memo_form.postal_code = 8_782_738
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include('Postal code をハイフンを入れて、半角数字で入力してください')
      end
      it 'phone_numberにハイフンが入っている' do
        @memo_form.phone_number = '090-3843-3848'
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include('Phone number にはハイフンを入れずに、10桁又は11桁の半角数字を使用してください')
      end
      it 'phone_numberが11桁以上' do
        @memo_form.phone_number = '090384757763'
        @memo_form.valid?
        expect(@memo_form.errors.full_messages).to include('Phone number にはハイフンを入れずに、10桁又は11桁の半角数字を使用してください')
      end
    end
  end
end
