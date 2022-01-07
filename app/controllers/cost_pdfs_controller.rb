class CostPdfsController < ApplicationController

  def index
    @cost_pdf = CostPdf.all
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
end
