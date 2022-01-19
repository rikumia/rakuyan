require 'rails_helper'

RSpec.describe CostPdf, type: :model do
  before do
    @cost_pdf = FactoryBot.build(:cost_pdf)
  end

  describe '見積書作成' do
    context '見積書ができるとき' do
      it 'company_name,postal_code,address,tell,fax,delivery_date,delivery_location,payment_terms,expiration_date,subtotal,total,tax,cliant_name,memo' do
        expect(@cost_pdf).to be_valid
      end
      it 'company_nameがあれば作成できる' do
        @cost_pdf.company_name = 'aaa'
        expect(@cost_pdf).to be_valid
      end
      it 'postal_codeがあれば作成できる' do
        @cost_pdf.postal_code = '000-0000'
        expect(@cost_pdf).to be_valid
      end
      it 'addressがあれば作成できる' do
        @cost_pdf.address = 'aaa'
        expect(@cost_pdf).to be_valid
      end
      it 'tellがあれば作成できる' do
        @cost_pdf.tell = '09000000000'
        expect(@cost_pdf).to be_valid
      end
      it 'subtotalがあれば作成できる' do
        @cost_pdf.subtotal = '1111'
        expect(@cost_pdf).to be_valid
      end
      it 'taxがあれば作成できる' do
        @cost_pdf.tax = '1111'
        expect(@cost_pdf).to be_valid
      end
      it 'totalがあれば作成できる' do
        @cost_pdf.total = '1111'
        expect(@cost_pdf).to be_valid
      end
      it 'cliant_nameがあれば作成できる' do
        @cost_pdf.cliant_name = 'aaa'
        expect(@cost_pdf).to be_valid
      end
    end
    context '見積書が作成できない場合' do
      it 'company_nameが空では作成できない' do
        @cost_pdf.company_name = ''
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("会社名を入力してください")
      end
      it 'postal_codeが空では作成できない' do
        @cost_pdf.postal_code = ''
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角ハイフンを含む形でなければ作成できない' do
        @cost_pdf.postal_code = '12345678'
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("郵便番号は次のように記述してください(例123-4567)")
      end
      it 'addressが空では作成できない' do
        @cost_pdf.address = ''
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("住所を入力してください")
      end
      it 'tellが空では作成できない' do
        @cost_pdf.tell = ''
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'tellに半角数字以外が含まれている場合は作成できない' do
        @cost_pdf.tell = '0901111222a'
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("電話番号は半角数字のみで記述してください")
      end
      it 'faxに半角数字以外が含まれている場合は作成できない' do
        @cost_pdf.fax = '0901111222a'
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("Faxは半角数字のみで記述してください")
      end
      it 'subtotalが空では作成できない' do
        @cost_pdf.subtotal = ''
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("小計を入力してください")
      end
      it 'subtotalは半角数字のみでなければ作成できない' do
        @cost_pdf.subtotal = '１１１'
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("小計は半角数字で入力してください")
      end
      it 'taxが空では作成できない' do
        @cost_pdf.tax = ''
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("消費税を入力してください")
      end
      it 'taxは半角数字のみでなければ作成できない' do
        @cost_pdf.tax = '１１１'
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("消費税は半角数字で入力してください")
      end
      it 'totalが空では作成できない' do
        @cost_pdf.total = ''
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("合計を入力してください")
      end
      it 'totalは半角数字のみでなければ作成できない' do
        @cost_pdf.total = '１１１'
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("合計は半角数字で入力してください")
      end
      it 'cliant_nameが空では作成できない' do
        @cost_pdf.cliant_name = ''
        @cost_pdf.valid?
        expect(@cost_pdf.errors.full_messages).to include("顧客名を入力してください")
      end
    end
  end
end
