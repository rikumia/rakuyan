module PracticePdf
  class CostPdf < Prawn::Document
    def initialize(cost_pdf, quotation)
      super(page_size: 'A4')
      stroke_axis

      ipaexm_path = "#{Rails.root}/app/assets/fonts/ipaexm.ttf"
      ipapm_spec  = {file: ipaexm_path, font: 'IPAPMincho'}
      font_families.update("ipapm" => {normal: ipapm_spec,
                                  bold: ipapm_spec,
                                  italic: ipapm_spec,
                                  bold_italic: ipapm_spec})
      font "ipapm"
      @cost_pdf = cost_pdf
      @quotation = quotation
      create_title
    end
    def create_title
      text '御    見    積    書', size: 20, align: :center
      stroke_horizontal_line 180, 340, :at=> 750
        stroke{
          horizontal_line 33, 230, :at=> 668
          horizontal_line 33, 300, :at=> 607
          horizontal_line 33, 300, :at=> 587
          horizontal_line 33, 300, :at=> 567
          horizontal_line 33, 300, :at=> 548
          horizontal_line 85, 446, :at=> 507
          horizontal_line 390, 503, :at=> 540
          horizontal_line 6, 415, :at=> 100
          horizontal_line 6, 415, :at=> 115
          horizontal_line 6, 415, :at=> 68
          horizontal_line 6, 415, :at=> 83
          horizontal_line 6, 415, :at=> 10
        }
        stroke_vertical_line 540, 610, :at => 390
        stroke{
          vertical_line 540, 610, :at => 503
          vertical_line 540, 610, :at => 445
          vertical_line 10, 115, :at => 6.5
          vertical_line 68, 115, :at => 300
          vertical_line 10, 115, :at => 415
        }
      font_size = 16
      move_down 55
      text_box("#{Time.now.strftime("%Y年%m月%d日")}",
                  :at => [0, y],
                  :width => bounds.right,
                  :align => :right)
      bounding_box([70, 680], width: 310, height: 65) do
        text @cost_pdf.cliant_name, size: 12, align: :left
      end
      bounding_box([200, 680], width: 310, height: 65) do
        text "御中", size: 12, align: :left
      end
      bounding_box([33, 650], width: 310, height: 65) do
        text "下記の通り御見積り申し上げます。", size: 12, align: :left
      end
      bounding_box([40, 620], width: 310, height: 65) do
        text "1.受渡期日    #{@cost_pdf.delivery_date}", size: 12, align: :left
      end
      bounding_box([40, 600], width: 310, height: 65) do
        text "2.納入場所    #{@cost_pdf.delivery_location}", size: 12, align: :left
      end
      bounding_box([40, 580], width: 310, height: 65) do
        text "3.支払条件    #{@cost_pdf.payment_terms}", size: 12, align: :left
      end
      bounding_box([40, 560], width: 310, height: 65) do
        text "4.有効期限    #{@cost_pdf.expiration_date}", size: 12, align: :left
      end
      bounding_box([305, 693], width: 310, height: 65) do
        text "〒#{@cost_pdf.postal_code}", size: 12, align: :left
      end
      bounding_box([308, 680], width: 310, height: 65) do
        text @cost_pdf.address, size: 12, align: :left
      end
      bounding_box([308, 665], width: 310, height: 65) do
        text @cost_pdf.company_name, size: 12, align: :left
      end
      bounding_box([308, 648], width: 310, height: 65) do
        text "TEL#{@cost_pdf.tell}/FAX#{@cost_pdf.fax}", size: 12, align: :left
      end
      bounding_box([390,610], :width=>270,:height=>360){
        table [
          ["検      印","担当者印"]
        ]
        }
      bounding_box([89, 535], width: 310, height: 65) do
        move_down 10
        text "御  見  積  金  額          ", size: 16, align: :left
      end
      bounding_box([135, 535], width: 310, height: 65) do
        move_down 10
        text "¥#{@cost_pdf.total.to_s(:delimited)}- (消費税込)", size: 16, align: :right
      end
      move_up 30
      rows = [["品            名","数   量","単位","単    価","金        額","備         考"]]
      table(rows, column_widths: [200, 45, 35, 60, 80, 90], position: :center) do |table|
        table.cells.size = 11
        table.row(0).align = :center
      end
      @quotation.each do |quotation|
      rows = [[quotation.product_name,quotation.quantity,quotation.unit,quotation.unit_price,quotation.money.to_s(:delimited),quotation.remarks]]
      table(rows, column_widths: [200, 45, 35, 60, 80, 90], position: :center) do |table|
        table.cells.size = 11
        table.row(0).align = :center
      end
    end
      bounding_box([120, 113], width: 310, height: 65) do
        text "小        計", size: 12, align: :left
      end
      bounding_box([100, 113], width: 310, height: 65) do
        text "#{@cost_pdf.subtotal.to_s(:delimited)}", size: 12, align: :right
      end
      bounding_box([120, 96], width: 310, height: 65) do
        text "消 費 税 等 ( 10% )", size: 12, align: :left
      end
      bounding_box([100, 96], width: 310, height: 65) do
        text "#{@cost_pdf.tax.to_s(:delimited)}", size: 12, align: :right
      end
      bounding_box([120, 80], width: 310, height: 65) do
        text "合        計", size: 12, align: :left
      end
      bounding_box([100, 80], width: 310, height: 65) do
        text "#{@cost_pdf.total.to_s(:delimited)}", size: 12, align: :right
      end
      bounding_box([10, 60], width: 310, height: 65) do
        text "備  考:", size: 12, align: :left
      end
      bounding_box([50, 61], width: 310, height: 65) do
        text @cost_pdf.memo, size: 12, align: :left
      end
    end
  end
end
