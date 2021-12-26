require 'rails_helper'

RSpec.describe Work, type: :model do
  before do
    @work = FactoryBot.build(:work)
  end

  describe '仕事管理登録' do
    context '仕事管理登録ができるとき' do
      it 'cliant_name,job_description,calendar,work_place,priceが存在すれば登録できる' do
        expect(@work).to be_valid
      end
      it 'cliant_nameがあれば登録できる' do
        @work.cliant_name = 'aaa'
        expect(@work).to be_valid
      end
      it 'job_descriptionがあれば登録できる' do
        @work.job_description = 'aaa'
        expect(@work).to be_valid
      end
      it 'calendarがあれば登録できる' do
        @work.calendar = '2021/12/24'
        expect(@work).to be_valid
      end
      it 'work_placeがあれば登録できる' do
        @work.work_place = 'aaa'
        expect(@work).to be_valid
      end
      it 'priceがあれば登録できる' do
        @work.price = '2000'
        expect(@work).to be_valid
      end
    end

    context '仕事管理登録ができない場合' do
      it 'cliant_nameが空では登録できない'do
        @work.cliant_name = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("顧客名を入力してください")
      end
      it 'job_descriptionが空では登録できない' do
        @work.job_description = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("仕事内容を入力してください")
      end
      it 'calendarが空では登録できない' do
        @work.calendar = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("カレンダーを入力してください")
      end
      it 'work_placeが空では登録できない' do
        @work.work_place = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("場所を入力してください")
      end
      it 'priceが空では登録できない' do
        @work.price = ''
        @work.valid?
        expect(@work.errors.full_messages).to include("金額を入力してください")
      end
      it 'priceは半角数字のみでなければ登録できない' do
        @work.price = '３００'
        @work.valid?
        expect(@work.errors.full_messages).to include("金額は半角数字で入力してください")
      end
      it 'priceに半角数字以外が含まれている場合は登録できない' do
        @work.price = '111a'
        @work.valid?
        expect(@work.errors.full_messages).to include("金額は半角数字で入力してください")
      end
    end
  end
end
