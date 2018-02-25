class ItemsController < ApplicationController



  def index
    @user = User.find(params[:user_id])
    @item = Item.new
    @items = @user.items.order('created_at ASC')
  end

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    @item.save
    redirect_to user_items_path(current_user)
  end

  def edit
    @item = Item.find(params[:id])
    @user = @item.user
    if @user != current_user
      flash[:alert] = "大哥別亂 拜託了"
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @user = @item.user

    if @user == current_user
      @item.update(item_params)
      redirect_to user_items_path(@user)
    else
      flash[:alert] = "大哥別亂 拜託了"
      redirect_to root_path
    end

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
