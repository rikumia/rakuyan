require 'rails_helper'

RSpec.describe Quotation, type: :model do
  before do
    @quotation = FactoryBot.build(:quotation)
  end

  describe '見積書作成' do
    context '見積書ができるとき' do
      it 'product_name,quantity,unit,unit_price,money,remarksがあれば作成できる' do
        expect(@quotation).to be_valid
      end
      it 'product_nameがあれば作成できる' do
        @quotation.product_name = 'aaa'
        expect(@quotation).to be_valid
      end
      it 'moneyがあれば作成できる' do
        @quotation.money = '1111'
        expect(@quotation).to be_valid
      end
    end
    context '見積書が作成できない場合' do
      it 'product_nameが空では作成できない' do
        @quotation.product_name = ''
        @quotation.valid?
        expect(@quotation.errors.full_messages).to include("Product nameを入力してください")
      end
      it 'moneyが空では作成できない' do
        @quotation.money = ''
        @quotation.valid?
        expect(@quotation.errors.full_messages).to include("Moneyを入力してください")
      end
      it 'moneyは半角数字のみでなければ作成できない' do
        @quotation.money = '１１１'
        @quotation.valid?
        expect(@quotation.errors.full_messages).to include("Moneyは半角数字で入力してください")
      end
      it 'cost_pdfが紐付いていなければ作成できない' do
        @quotation.cost_pdf = nil
        @quotation.valid?
        expect(@quotation.errors.full_messages).to include("Cost pdfを入力してください")
      end
    end
  end
end
