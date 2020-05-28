class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items = Item.includes(:images).order('created_at DESC')
    # @items = Item.all
    # binding.pry
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
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :brand, :status, :postage, :prefecture_id, :shipping_days, :price, images_attributes: [:url, :_destroy, :id])
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
