class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all.order("created_at DESC")
    # @items = Item
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
  
  def show
  end
 
  def edit
  end

  def update
    if @item.update(item_params)
       redirect_to root_path
    else
      render :edit   
    end
  end
  
  def destroy
    if @item.destroy
       redirect_to root_path
    end
  end   
  
  private

  def item_params
    params.require(:item).permit(:image, :category_id, :price, :text, :name, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id,  ).merge(user_id: current_user.id)
  end

  def set_item
   @item = Item.find(params[:id]) 
  end
end