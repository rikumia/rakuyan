class CliantsController < ApplicationController
  before_action :set_cliant, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:edit, :show]

  def index
    @cliants = Cliant.where(user_id: current_user.id)
    @search_cliant = Cliant.ransack(params[:q])
    @cliants = @search_cliant.result(distinct: true).order('created_at DESC')
  end

  def new
    @cliant = Cliant.new
  end

  def create
    @cliant = Cliant.new(cliant_params)
   if @cliant.save
    redirect_to cliants_path
   elsif
    render :new
   end
  end

  def show
  end

  def edit
  end

  def update
    if @cliant.update(cliant_params)
      redirect_to cliants_path
    else
      render :edit
    end
  end

  def destroy
    @cliant.destroy
    redirect_to cliants_path
  end

  private

  def cliant_params
    params.require(:cliant).permit(:cliant_name, :email, :tell, :fax, :address).merge(user_id: current_user.id)
  end

  def set_cliant
    @cliant = Cliant.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @cliant.user_id
      redirect_to user_session_path
    end
  end
end
