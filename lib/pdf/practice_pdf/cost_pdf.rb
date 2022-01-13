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
          horizontal_line 6, 516.5, :at=> 20
          horizontal_line 6, 516.5, :at=> 500
          horizontal_line 6, 516.5, :at=> 480
          horizontal_line 6, 516.5, :at=> 460
          horizontal_line 6, 516.5, :at=> 440
          horizontal_line 6, 516.5, :at=> 420
          horizontal_line 6, 516.5, :at=> 400
          horizontal_line 6, 516.5, :at=> 380
          horizontal_line 6, 516.5, :at=> 360
          horizontal_line 6, 516.5, :at=> 340
          horizontal_line 6, 516.5, :at=> 320
          horizontal_line 6, 516.5, :at=> 300
          horizontal_line 6, 516.5, :at=> 280
          horizontal_line 6, 516.5, :at=> 260
          horizontal_line 6, 516.5, :at=> 240
          horizontal_line 6, 516.5, :at=> 220
          horizontal_line 6, 516.5, :at=> 200
          horizontal_line 6, 516.5, :at=> 180
          horizontal_line 6, 516.5, :at=> 160
          horizontal_line 6, 516.5, :at=> 140
          horizontal_line 6, 516.5, :at=> 120
          horizontal_line 6, 516.5, :at=> 100
          horizontal_line 6, 516.5, :at=> 80
        }
        stroke_vertical_line 540, 610, :at => 390
        stroke{
          vertical_line 540, 610, :at => 503
          vertical_line 540, 610, :at => 445
          vertical_line 20, 500, :at => 6.5
          vertical_line 140, 500, :at => 206.5
          vertical_line 140, 500, :at => 246.5
          vertical_line 140, 500, :at => 276.5
          vertical_line 80, 500, :at => 336.5
          vertical_line 80, 500, :at => 416.5
          vertical_line 20, 500, :at => 516.5
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
      bounding_box([6.5, 480], width: 510, height: 65) do
      rows = [[@quotation.product_name]]
      table(rows, column_widths: [200, 40, 30, 60, 80, 100], position: :center) do |table|
        table.cells.size = 10
        table.row(0).align = :center
      end
      end
      bounding_box([70, 496], width: 310, height: 65) do
        text "品            名", size: 12, align: :left
      end
      bounding_box([210, 496], width: 310, height: 65) do
        text "数   量", size: 12, align: :left
      end
      bounding_box([250, 496], width: 310, height: 65) do
        text "単位", size: 12, align: :left
      end
      bounding_box([286, 496], width: 310, height: 65) do
        text "単    価", size: 12, align: :left
      end
      bounding_box([350, 496], width: 310, height: 65) do
        text "金        額", size: 12, align: :left
      end
      bounding_box([435, 496], width: 310, height: 65) do
        text "備         考", size: 12, align: :left
      end
      bounding_box([120, 135], width: 310, height: 65) do
        text "小        計", size: 12, align: :left
      end
      bounding_box([100, 135], width: 310, height: 65) do
        text "#{@cost_pdf.subtotal.to_s(:delimited)}", size: 12, align: :right
      end
      bounding_box([120, 115], width: 310, height: 65) do
        text "消 費 税 等 ( 10% )", size: 12, align: :left
      end
      bounding_box([100, 115], width: 310, height: 65) do
        text "#{@cost_pdf.tax.to_s(:delimited)}", size: 12, align: :right
      end
      bounding_box([120, 95], width: 310, height: 65) do
        text "合        計", size: 12, align: :left
      end
      bounding_box([100, 95], width: 310, height: 65) do
        text "#{@cost_pdf.total.to_s(:delimited)}", size: 12, align: :right
      end
      bounding_box([10, 75], width: 310, height: 65) do
        text "備  考:", size: 12, align: :left
      end
      bounding_box([10, 63], width: 310, height: 65) do
        text @cost_pdf.memo, size: 12, align: :left
      end
    end
  end
end
