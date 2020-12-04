class AddressFormsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_buyer, only: [:index, :create]
  def index
    @memoform = MemoForm.new
  end

  def create
    @memoform = MemoForm.new(address_params)
    if @memoform.valid?
      pay_item
      @memoform.save
      redirect_to root_path
    else
      # ①バリデーションに引っ掛かったら購入ページに戻る
      render :index
    end
  end

  private

  def set_buyer
    @item = Item.find(params[:item_id])
  end

  def address_params
    params.require(:memo_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
