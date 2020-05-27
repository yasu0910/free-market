class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :brand, :status, :postage, :prefecture_id, :shipping_days, :price, images_attributes: [:url, :_destroy, :id])
  end
  
end
