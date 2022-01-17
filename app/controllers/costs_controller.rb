class CostsController < ApplicationController
  before_action :set_cost, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:edit, :show]

  def index
    @costs = Cost.all
    @cost_by_month = @costs.group_by_month(:calendar).sum(:sales)
    @chartlabels = @cost_by_month.map(&:first).to_json.html_safe
    @chartdatas = @cost_by_month.map(&:second)
    @q = Cost.ransack(params[:q])
    @costs = @q.result(distinct: true).where(user_id: current_user.id).order('created_at DESC')
  end

  def new
    @cost = Cost.new
  end

  def create
    @cost = Cost.new(cost_params)
    if @cost.save
    redirect_to costs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cost.update(cost_params)
      redirect_to costs_path
    else
      render :edit
    end
  end

  def destroy
    @cost.destroy
    redirect_to costs_path
  end

  private

  def cost_params
    params.require(:cost).permit(:cliant_name, :calendar, :sales, :cost, :profit, :profit_was).merge(user_id: current_user.id)
  end

  def set_cost
    @cost = Cost.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @cost.user_id
      redirect_to user_session_path
    end
  end
end
