class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
  end  
  
  
  def new
    @item = Item.new
  end 

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :price, :text, :name, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id ).merge(user_id: current_user.id)
  end

end
