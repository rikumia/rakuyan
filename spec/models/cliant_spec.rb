require 'rails_helper'

RSpec.describe Cliant, type: :model do
  before do
    @cliant = FactoryBot.build(:cliant)
  end
  describe '顧客管理登録' do
    context '顧客管理登録ができるとき' do
      it 'cliant_name,email,tell,addressが存在すれば登録できる' do
        expect(@cliant).to be_valid
      end
      it 'cliant_nameがあれば登録できる' do
        @cliant.cliant_name = 'aaa'
        expect(@cliant).to be_valid
      end
      it 'tellがあれば登録できる' do
        @cliant.tell = '09000000000'
        expect(@cliant).to be_valid
      end
      it 'addressがあれば登録できる' do
        @cliant.address = 'aaa'
        expect(@cliant).to be_valid
      end
    end
    context '顧客管理登録ができない場合' do
      it 'cliant_nameが空では登録できない' do
        @cliant.cliant_name = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("顧客名を入力してください")
      end
      it "emailが空では登録できない" do
        @cliant.email = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'tellが空では登録できない' do
        @cliant.tell = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'tellに半角数字以外が含まれている場合は登録できない' do
        @cliant.tell = '0901111222a'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("電話番号は半角数字のみで記述してください")
      end
      it 'faxに半角数字以外が含まれている場合は登録できない' do
        @cliant.fax = '0901111222a'
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("Faxは半角数字のみで記述してください")
      end
      it 'addressが空では登録できない' do
        @cliant.address = ''
        @cliant.valid?
        expect(@cliant.errors.full_messages).to include("住所を入力してください")
      end
    end
  end
end
