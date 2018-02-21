class ItemsController < ApplicationController



  def index
    @user = current_user
    @item = Item.new
    @items = Item.order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to user_items_path(current_user)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.save
    redirect_to user_items_path(current_user)
  end


  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_items_path(current_user)
  end


  private

  def item_params
    params.require(:item).permit(:title, :description)

  end

end
