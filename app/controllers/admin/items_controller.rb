class Admin::ItemsController < ApplicationController
  before_action :check_admin?


  def index
  end



  private

  def check_admin?
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = "You are not me!"
    end
  end

end
