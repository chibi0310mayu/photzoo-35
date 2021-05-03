require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe '#create' do
    before do
      @photo = FactoryBot.build(:photo)
    end
    context '商品出品登録ができる時' do
      it 'image, name, explanation, condition_id, burden_id, area_id, shipping_id, priceが存在すれば登録ができる' do
        expect(@photo).to be_valid
      end
    end

    context '商品出品登録ができない時' do
      it 'imageが空では登録できない' do
        @photo.image = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録ができない' do
        @photo.name = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Name can't be blank")
      end

      it '説明が空では登録できない' do
        @photo.explanation = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'condition_idが空だと登録できない' do
        @photo.condition_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Condition is not a number')
      end

      it 'condition_idが1だと登録できない' do
        @photo.condition_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Condition must be other than 1')
      end

      it 'burden_idが空だと登録できない' do
        @photo.burden_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Burden is not a number')
      end

      it 'burden_idが1だと登録できない' do
        @photo.burden_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Burden must be other than 1')
      end

      it 'area_idが空だと登録できない' do
        @photo.area_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Area is not a number')
      end

      it 'area_idが1だと登録できない' do
        @photo.area_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Area must be other than 1')
      end

      it 'shipping_idが空だと登録できない' do
        @photo.shipping_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Shipping is not a number')
      end

      it 'shipping_idが1だと登録できない' do
        @photo.shipping_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Shipping must be other than 1')
      end

      it 'priceが空だと登録できない' do
        @photo.price = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceは半角数字でないと登録できない' do
        @photo.price = '３００'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは300以下では登録できない' do
        @photo.price = 299
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceは9,999,999以上だと登録できない' do
        @photo.price = 10_000_000
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '半角英数混合では登録できないこと' do
        @photo.price = 'ab123'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Price is not a number')
      end

      it '半角英語だけでは登録できないこと' do
        @photo.price = 'abcd'
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Price is not a number')
      end
    end
  end

end
