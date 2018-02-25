class ContacksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @contacks = @user.inverse_contacks.order(created_at: "desc")
    @contack = Contack.new
  end

  def create
    @user = User.find(params[:user_id])
    @contack = current_user.contacks.build(contack_params)
    @contack.contack_id = @user.id
    @contack.save
    redirect_to user_contacks_path(@user)
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

  def show
    @user = User.find(params[:user_id])
    @contack = Contack.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @contack = Contack.find(params[:id])
    @contack.delete
    redirect_to user_contacks_path(@user)
  end

  private

  def contack_params
    params.require(:contack).permit(:sentence)
  end

end
