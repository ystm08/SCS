require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it '名前が空では登録できない' do
        @user.name = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end

      it 'フリガナが空では登録できない' do
        @user.name_kana = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('フリガナを入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      
      it 'フリガナが空では登録できない' do
        @user.name_kana = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('フリガナを入力してください')
      end
    end

  end
end