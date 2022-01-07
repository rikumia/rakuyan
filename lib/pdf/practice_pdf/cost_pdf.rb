module PracticePdf
  class CostPdf < Prawn::Document
    def initialize
      super(page_size: 'A4')
      stroke_axis

      ipaexm_path = "#{Rails.root}/app/assets/fonts/ipaexm.ttf"
      ipapm_spec  = {file: ipaexm_path, font: 'IPAPMincho'}
      font_families.update("ipapm" => {normal: ipapm_spec,
                                  bold: ipapm_spec,
                                  italic: ipapm_spec,
                                  bold_italic: ipapm_spec})
      font "ipapm"
      create_title

    end
    def create_title
      text '御見積書', size: 20, align: :center
      font_size = 16
      move_down 65
      text_box("#{Time.now.strftime("%Y年%m月%d日")}",
                  :at => [0, y],
                  :width => bounds.right,
                  :align => :right)
      bounding_box([80, 670], width: 310, height: 65) do
        text "株式会社◯◯   御中", size: 12, align: :left
      end
      bounding_box([40, 640], width: 310, height: 65) do
        text "下記の通り御見積り申し上げます。", size: 12, align: :left
      end
      bounding_box([40, 610], width: 310, height: 65) do
        text "1.受け渡し日", size: 12, align: :left
      end
      bounding_box([40, 590], width: 310, height: 65) do
        text "2.納入場所", size: 12, align: :left
      end
      bounding_box([40, 570], width: 310, height: 65) do
        text "3.支払条件", size: 12, align: :left
      end
      bounding_box([40, 550], width: 310, height: 65) do
        text "4.有効期限", size: 12, align: :left
      end
      bounding_box([320, 690], width: 310, height: 65) do
        text "〒486-0817", size: 12, align: :left
      end
      bounding_box([320, 670], width: 310, height: 65) do
        text "愛知県春日井市東野町3-7-8", size: 12, align: :left
      end
      bounding_box([320, 650], width: 310, height: 65) do
        text "吉田建築", size: 12, align: :left
      end
      bounding_box([320, 630], width: 310, height: 65) do
        text "TEL0568-82-5678/FAX0568-82-7878", size: 12, align: :left
      end
      bounding_box([90, 525], width: 310, height: 65) do
        move_down 10
        text "御見積り金額       ¥11,000-(消費税込)", size: 16, align: :center
      end
      rows = [['品名', '数量', '単価', '金額', '備考'], ['', '', '', '', '']]
      table(rows, column_widths: [290, 30, 60, 60, 80], position: :center) do |table|
        table.cells.size = 10
        table.row(0).align = :center
      end
      bounding_box([373, 300], width: 150, height: 100) do
        table [['小計', ""], ['消費税', ""], ['合計金額', ""]], column_widths: [50, 100], position: :right do |table|
          table.cells.size = 10
        end
      end
    end
  end
end
