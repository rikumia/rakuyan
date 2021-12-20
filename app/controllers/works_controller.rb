class WorksController < ApplicationController
  before_action :set_work, only: [:edit, :show, :update, :destroy]

  def index
    @works = Work.all.order('created_at DESC')
  end

  def new
   @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @work.destroy
    redirect_to works_path
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to works_path
    else
      render :edit
    end
  end

  private

  def work_params
    params.require(:work).permit(:cliant_name, :job_description, :calendar, :work_place, :price).merge(user_id: current_user.id)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
