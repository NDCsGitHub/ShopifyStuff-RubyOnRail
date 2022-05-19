class ItemsController < ApplicationController

  before_action :current_item_with_deleted, only: [:show, :restore]
  before_action :current_item, only: [:edit, :update, :delete, :destroy]


  def index
    @items=Item.without_deleted
    @deleted_items=Item.only_deleted
  end

  def show
  end

  def new
    @item=Item.new
  end
  
  def create
    item=Item.create(item_params)
    redirect_to items_path
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def delete
  end

  def destroy
    @item.update(deleted_item_params)
    @item.destroy
    redirect_to items_path
  end

  def restore
    @item.restore
    @item.deleted_comment = ''
    redirect_to items_path
  end



  private
  def item_params
    params.require(:item).permit(:name,:quantity,:description)
  end

  def deleted_item_params
    params.permit(:deleted_comment)
  end

  def current_item_with_deleted
    @item=Item.with_deleted.find(params[:id])
  end

  def current_item
    @item=Item.find(params[:id])
  end

end
