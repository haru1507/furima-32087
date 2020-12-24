require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '出品画像、商品名と商品の説明、カテゴリーと商品の状態、配送料の負担と発送元の地域、発送までの日数と価格があれば商品は出品される' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '出品画像がないと商品は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '出品名がないと商品は出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明がないと商品は出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'カテゴリーの情報がないと商品は出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category is not a number'
      end
      it 'カテゴリーの情報が1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it '商品の状態についての情報がないと商品は出品できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Sales status is not a number'
      end
      it '商品の状態についての情報が1だと登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Sales status must be other than 1'
      end
      it '配送料の負担についての情報がないと商品は出品できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee status is not a number'
      end
      it '配送料の負担についての情報が1だと登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee status must be other than 1'
      end
      it '発送元の地域についての情報がないと商品は出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture is not a number'
      end
      it '発送元の地域についての情報が1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it '発送までの日数についての情報がないと商品は出品できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Scheduled delivery is not a number'
      end
      it '発送までの日数についての情報が1だと登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Scheduled delivery must be other than 1'
      end
      it '価格についての情報がないと商品は出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格の範囲が¥300~¥9,999,999の間でないと商品は出品できない（¥299以下）' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 299'
      end
      it '価格の範囲が¥300~¥9,999,999の間でないと商品は出品できない（¥10,000,000以上）' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
      it '販売価格は半角数字でないと商品は出品できない（全角数字のみ）' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '販売価格は半角数字でないと商品は出品できない（半角英語のみ）' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '販売価格は半角数字でないと商品は出品できない（半角英数字混合のみ）' do
        @item.price = '１２３abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
