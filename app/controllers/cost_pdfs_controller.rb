class CostPdfsController < ApplicationController
  before_action :set_cost_pdf, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:edit]

  def index
    @cost_pdfs = CostPdf.where(user_id: current_user.id).order('created_at DESC')
  end

  def new
    @cost_pdf = CostPdf.new
  end

  def create
    @cost_pdf = CostPdf.new(cost_pdf_params)
    if @cost_pdf.save
    redirect_to cost_pdfs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cost_pdf.update(cost_pdf_params)
      redirect_to cost_pdfs_path
    else
      render :edit
    end
  end

  def destroy
    @cost_pdf.destroy
    redirect_to cost_pdfs_path
  end

  def prawn
    respond_to do |format|
      format.pdf do
        cost_pdf = PracticePdf::CostPdf.new().render
        send_data cost_pdf,
          filename: 'cost_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline'
      end
    end
  end

  private

  def cost_pdf_params
    params.require(:cost_pdf).permit(:company_name, :postal_code, :address, :tell, :fax, :delivery_date,
                                     :delivery_location, :payment_terms, :expiration_date, :cliant_name, :product_name,
                                     :quantity, :unit, :unit_price, :money, :remarks, :subtotal, :tax, :total, :memo).merge(user_id: current_user.id)
  end

  def set_cost_pdf
    @cost_pdf = CostPdf.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @work.user_id
      redirect_to user_session_path
    end
  end
end
