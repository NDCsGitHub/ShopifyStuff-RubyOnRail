class ItemsController < ApplicationController
  def index
    @items=Item.without_deleted
    @deleted_items=Item.only_deleted
  end


  def show
    @item=Item.with_deleted.find(params[:id])
  end

  def new
    @item=Item.new
  end
  
  def create
    item=Item.create(item_params)
    redirect_to items_path
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def delete
    @item=Item.find(params[:id])
  end


  def destroy
    @item=Item.find(params[:id])
    @item.update(deleted_item_params)
    @item.destroy
    redirect_to items_path
  end




  private
  def item_params
    params.require(:item).permit(:name,:quantity,:description)
  end

  def deleted_item_params
    params.permit(:deleted_comment)

  end
end
