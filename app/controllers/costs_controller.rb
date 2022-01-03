class CostsController < ApplicationController
  before_action :set_cost, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:edit, :show]

  def index
    @costs = Cost.all.order('created_at DESC')
    @cost_by_day = @costs.group_by_day(:calendar).sum(:sales)
    @chartlabels = @cost_by_day.map(&:first).to_json.html_safe
    @chartdatas = @cost_by_day.map(&:second)
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

  private

  def cost_params
    params.require(:cost).permit(:cliant_name, :calendar, :sales, :cost, :profit, :profit_rate).merge(user_id: current_user.id)
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
