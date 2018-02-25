class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    redirect_to user_items_path(@user)
  end

  def contacktos
    @user = User.find(params[:id])
    
    @contacktos = @user.contacks
  end

  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

end
