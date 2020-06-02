class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :show]
  def index
    @items = Item.includes(:images).limit(9).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.build
    
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("選択してください")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def get_category_children  
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children  
  end

  def edit_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children  
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def edit_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def edit
    @category_parent = @item.category.root.name
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("選択してください")
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
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
        flash[:item_delete_notice] = "削除が完了しました"
        redirect_to root_path
    else
      flash[:item_delete_alert] = '削除が失敗しました'
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :content, :brand, :status, :postage, :prefecture_id, :shipping_days, :price, images_attributes: [:url, :_destroy, :id])
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
