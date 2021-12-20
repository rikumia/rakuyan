class CliantsController < ApplicationController
  def index
    @cliants = Cliant.all.order('created_at DESC')
  end

  def new
    @cliant = Cliant.new

  end

  def create
    # binding.pry
    @cliant = Cliant.new(cliant_params)
   if @cliant.save
    redirect_to cliants_index_path
   elsif
    render :new
   end
  end

  private

  def cliant_params
    params.require(:cliant).permit(:cliant_name, :email, :tell, :fax, :address).merge(user_id: current_user.id, work_id: params[:work_id])
  end
end
