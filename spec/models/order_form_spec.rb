require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order = FactoryBot.build(:order_form)
  end
  describe '購入者情報登録' do
    context '購入者情報が登録できるとき' do
      it 'building以外のカラムが全て存在するとき' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    context '購入者情報が登録でいない時' do
      it 'tokenが空では登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'priceが空では登録できない' do
        @order.price = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end
      it 'postが空では登録できない ' do
        @order.post = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post can't be blank")
      end
      it 'postは-がなければ登録できない' do
        @order.post = '0630884'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end
      it 'postは8桁以上では登録できない' do
        @order.post = '0530-0000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end
      it 'postは6桁以下では登録できない' do
        @order.post = '053-000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end
      it 'postは数字でなければ登録できない' do
        @order.post = 'aaa-ああああ'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end
      it 'area_idが空では登録できない' do
        @order.area_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
      end
      it 'municipalityが空では登録できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは9桁では登録できない' do
        @order.phone_number = '080080080'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは12桁では登録できない' do
        @order.phone_number = '080080080080'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは数字でなければ登録できない' do
        @order.phone_number = 'ああああaaaaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空では登録できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'product_listing_idが空では登録できない' do
        @order.product_listing_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Product listing can't be blank")
      end
    end
  end
end
# bundle exec rspec spec/models/order_form_spec.rb
