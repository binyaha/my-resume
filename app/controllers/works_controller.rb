class WorksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @user = current_user
    @work = Work.new
  end

  def create
    @user = current_user
    @work = Work.new(work_params)
    @work.save
    redirect_to user_works_path(@user)
  end

  def destroy
    @user = current_user
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to user_works_path(@user)
  end

  def edit
    @user = current_user
    @work = Work.find(params[:id])
  end

  def update
    @user = current_user
    @work = Work.find(params[:id])
    @work.update(work_params)
    @work.save
    redirect_to user_works_path(@user)
  end

  private

  def work_params
    params.require(:work).permit(:project_name, :description, :photo, :src, :git_src)
  end


end
