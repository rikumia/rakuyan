require 'rails_helper'

RSpec.describe Cost, type: :model do
  before do
    @cost = FactoryBot.build(:cost)
  end
  describe '売り上げ管理登録' do
    context '売り上げ管理登録ができるとき' do
      it 'calendar,cliant_name,sales,cost,tax,profitが存在すれば登録できる' do
        expect(@cost).to be_valid
      end
      it 'calenderがあれば登録できる' do
        @cost.calendar = '2021/12/24'
        expect(@cost).to be_valid
      end
      it 'cliant_nameがあれば登録できる' do
        @cost.cliant_name = 'aaa'
        expect(@cost).to be_valid
      end
      it 'salesがあれば登録できる' do
        @cost.sales = '1111'
        expect(@cost).to be_valid
      end
      it 'costがあれば登録できる' do
        @cost.cost = '1111'
        expect(@cost).to be_valid
      end
      it 'taxがあれば登録できる' do
        @cost.tax = '1111'
        expect(@cost).to be_valid
      end
      it 'profitがあれば登録できる' do
        @cost.profit = '1111'
        expect(@cost).to be_valid
      end
    end
    context '売り上げ管理登録ができない場合' do
      it 'calenderが空では登録できない' do
        @cost.calendar = ''
        @cost.valid?
        expect(@cost.errors.full_messages).to include("カレンダーを入力してください")
      end
      it 'cliant_nameが空では登録できない' do
        @cost.cliant_name = ''
        @cost.valid?
        expect(@cost.errors.full_messages).to include("顧客名を入力してください")
      end
      it 'salesが空では登録できない' do
        @cost.sales = ''
        @cost.valid?
        expect(@cost.errors.full_messages).to include("売り上げを入力してください")
      end
      it 'salesは半角数字のみでなければ登録できない' do
        @cost.sales = '１１１'
        @cost.valid?
        expect(@cost.errors.full_messages).to include("売り上げは半角数字で入力してください")
      end
      it 'costが空では登録できない' do
        @cost.cost = ''
        @cost.valid?
        expect(@cost.errors.full_messages).to include("経費を入力してください")
      end
      it 'costは半角数字のみでなければ登録できない' do
        @cost.cost = '１１１'
        @cost.valid?
        expect(@cost.errors.full_messages).to include("経費は半角数字で入力してください")
      end
      it 'taxが空では登録できない' do
        @cost.tax = ''
        @cost.valid?
        expect(@cost.errors.full_messages).to include("消費税を入力してください")
      end
      it 'taxは半角数字のみでなければ登録できない' do
        @cost.tax = '１１１'
        @cost.valid?
        expect(@cost.errors.full_messages).to include("消費税は半角数字で入力してください")
      end
      it 'profitが空では登録できない' do
        @cost.profit = ''
        @cost.valid?
        expect(@cost.errors.full_messages).to include("利益を入力してください")
      end
      it 'profitは半角数字のみでなければ登録できない' do
        @cost.profit = '１１１'
        @cost.valid?
        expect(@cost.errors.full_messages).to include("利益は半角数字で入力してください")
      end
    end
  end
end
