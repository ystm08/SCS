require 'rails_helper'

RSpec.describe 'Itemモデルのテスト', type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe 'バリデーションのテスト' do
    subject { item.valid? }

    context '空欄でないこと' do
      # TODO:item_imageのバリデーションテスト記述変更
      # it '商品画像が選択されていないと登録できない' do
      #   @item.item_image.attach(io: File.open('app/images/no_image.jpg'), filename: 'no_image.jpg')
      #   @item.item_image = ''
      #   expect(@item).to be_invalid
      #   expect(@item.errors.full_messages).to include('商品画像を入力してください')
      # end

      it '商品名が空欄では登録できない' do
        @item.name = ''
        expect(@item).to be_invalid
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品説明が空欄では登録できない' do
        @item.introduction = ''
        expect(@item).to be_invalid
        expect(@item.errors.full_messages).to include('商品説明を入力してください')
      end

      it 'カテゴリーが空欄では登録できない' do
        @item.category_id = ''
        expect(@item).to be_invalid
      end

      it '税抜き価格が空欄では登録できない' do
        @item.price = ''
        expect(@item).to be_invalid
        expect(@item.errors.full_messages).to include('税抜価格を入力してください')
      end
    end
  end
end