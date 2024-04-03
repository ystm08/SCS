require 'rails_helper'

RSpec.describe 'Itemモデルのテスト', type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe 'バリデーションのテスト' do
    subject { item.valid? }

    context '空欄でないこと' do
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
    end
  end

end