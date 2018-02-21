class ItemsController < ApplicationController



  def index
    @user = User.first
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:title, :description)

  end

end
