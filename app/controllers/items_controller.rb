class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.build
    
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :content, :brand, :status, :postage, :prefecture_id, :shipping_days, :price, images_attributes: [:url, :_destroy, :id])
  end
  
end
