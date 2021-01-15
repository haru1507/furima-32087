require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  context '商品購入がうまくいくとき' do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@user_order).to be_valid
    end
  end

  context '商品購入がうまくいかないとき' do
    it '郵便番号がないと購入できない' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンがないと購入できない' do
      @user_order.postal_code = "1234567"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid")
    end
    it '都道府県がないと購入できない' do
      @user_order.prefecture_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture is not a number")
    end
    it '都道府県の情報が1だと購入できない' do
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '市区町村がないと購入できない' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it '番地がないと購入できない' do
      @user_order.addresses = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
    end
    it '電話番号がないと購入できない' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがあると購入できない' do
      @user_order.phone_number = '090-123-567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is not a number")
    end
    it '電話番号が12桁以上だと購入できない' do
      @user_order.phone_number = '090123456789'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
