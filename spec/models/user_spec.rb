require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'バリデーションのテスト' do
    subject { @user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context '空欄でないこと' do
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

      it 'パスワードが空では登録できない' do
        @user.password = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it '電話番号が空では登録できない' do
        @user.phone_number = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('電話番号を入力してください')
      end

      it '郵便番号が空では登録できない' do
        @user.post_code = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('郵便番号を入力してください')
      end

      it '住所が空では登録できない' do
        @user.address = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('住所を入力してください')
      end

      it 'アカウント名が空では登録できない' do
        @user.user_name = ''
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('アカウント名を入力してください')
      end
    end

    context '一意性があること' do
      it 'emailが重複すると登録できない' do
        user.email = other_user.email
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('Eメールはすでに存在します')
      end
    end

    context '文字数の検証' do
      it 'パスワードが6文字以上であること: 5文字以下は×' do
        @user.password = '12345'
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
    end

    context 'パスワードと確認用パスワードの一致' do
      it 'パスワードの確認用が一致しない場合は無効であること' do
        @user.password_confirmation = 'different_password'
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end