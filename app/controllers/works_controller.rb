class WorksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @works = @user.works.order(created_at: "desc")
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @user = current_user
    @work = @user.works.build(work_params)
    @work.save
    @work_table = WorkTable.create(user_id: @user.id, work_id: @work.id )
    redirect_to user_works_path(@user)
  end

  def destroy
    @user = current_user
    @work = Work.find(params[:id])
    if @work.users.count == 1 && @work.work_tables.order(created_at: "asc").first.user == @user
      @work.destroy
      redirect_to user_works_path(@user)
    else
      flash[:alert] = "你不是第一作者"
    end      

  end

  def edit
    @work = Work.find(params[:id])
    @user = @work.work_tables.order(created_at: "asc").first.user
    if @user != current_user
      flash[:alert] = "你不是第一作者"
      redirect_to root_path
    end
  end

  def update
    @work = Work.find(params[:id])
    @user = @work.work_tables.order(created_at: "asc").first.user
    if @user != current_user
      flash[:alert] = "你不是第一作者"
      redirect_to root_path
    else
      @work.update(work_params)
      redirect_to user_works_path(@user)
    end
  end

  private

  def work_params
    params.require(:work).permit(:project_name, :description, :photo, :src, :git_src)
  end


end
