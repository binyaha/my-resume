class ContacksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @contacks = Contack.all
    @contack = Contack.new
  end

  def create
    @user = User.find(params[:user_id])
    @contack = Contack.new(contack_params)
    @contack.save
    redirect_to contacks_user_path(@user)
  end

  def edit
    @user = User.find(params[:user_id])
    @contack = Contack.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @contack = Contack.find(params[:id])
    @contack.update(contack_params)
    @contack.save
    redirect_to contacks_user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @contack = Contack.find(params[:id])
    @contack.delete
    redirect_to contacks_user_path(@user)
  end

  private

  def contack_params
    params.require(:contack).permit(:sentence)
  end

end
