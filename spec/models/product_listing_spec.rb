require 'rails_helper'

RSpec.describe ProductListing, type: :model do
  before do
    @product = FactoryBot.build(:product_listing)
    @product.image = fixture_file_upload('app/assets/images/furima-footer.png')
  end

  describe '商品登録' do
    context '商品登録できないとき' do
      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では登録できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'explainが空では登録できない' do
        @product.explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explain can't be blank")
      end
      it 'category_idが空では登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Category is not a number', "Category can't be blank")
      end
      it 'category_idが数値でなければ登録できない' do
        @product.category_id = 'あイ雨'
        @product.valid?
        expect(@product.errors.full_messages).to include('Category is not a number')
      end
      it 'category_idが1では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end
      it 'state_idが空では登録できない' do
        @product.state_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('State is not a number', "State can't be blank")
      end
      it 'state_idが数値でなければ登録できない' do
        @product.state_id = 'あイ雨'
        @product.valid?
        expect(@product.errors.full_messages).to include('State is not a number')
      end
      it 'state_idが1では登録できない' do
        @product.state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('State must be other than 1')
      end
      it 'delivery_fee_idが空では登録できない' do
        @product.delivery_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery fee is not a number', "Delivery fee can't be blank")
      end
      it 'delivery_fee_idが数値でなければ登録できない' do
        @product.delivery_fee_id = 'あイ雨'
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery fee is not a number')
      end
      it 'delivery_fee_idが1では登録できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'area_idが空では登録できない' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Area is not a number', "Area can't be blank")
      end
      it 'area_idが数値でなければ登録できない' do
        @product.area_id = 'あイ雨'
        @product.valid?
        expect(@product.errors.full_messages).to include('Area is not a number')
      end
      it 'day_to_ship_idが空では登録できない' do
        @product.days_to_ship_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Days to ship is not a number', "Days to ship can't be blank")
      end
      it 'day_to_ship_idが数値でなければ登録できない' do
        @product.days_to_ship_id = 'あイ雨'
        @product.valid?
        expect(@product.errors.full_messages).to include('Days to ship is not a number')
      end
      it 'day_to_ship_idが1では登録できない' do
        @product.days_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it 'feeが空では登録できない' do
        @product.fee = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Fee can't be blank", 'Fee is not included in the list',
                                                         'Fee 半角数字を使用してください')
      end
      it 'feeが半角数字でなければ登録できない' do
        @product.fee = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Fee is not included in the list')
      end
      it 'feeが全角文字だけでは登録できない' do
        @product.fee = 'あああ'
        @product.valid?
        expect(@product.errors.full_messages).to include('Fee is not included in the list')
      end
      it '半角英数混合では登録できない' do
        @product.fee = 'a300b'
        @product.valid?
        expect(@product.errors.full_messages).to include('Fee is not included in the list')
      end
      it '半角英語だけでは登録できない' do
        @product.fee = 'abc'
        @product.valid?
        expect(@product.errors.full_messages).to include('Fee is not included in the list')
      end
      it '299円以下では登録できない' do
        @product.fee = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Fee is not included in the list')
      end
      it '10000000以上では登録できない' do
        @product.fee = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Fee is not included in the list')
      end
    end
    context '新規登録できるとき' do
      it '全てのカラムが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
  end
end
# bundle exec rspec spec/models/product_listing_spec.rb
