require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

describe 'user modelのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # let!(:user) { FactoryBot.create(:user)}
    # let!(:second_user) { FactoryBot.create(:second_user)}
    let!(:user) { FactoryBot.create(:user) }
   end

    context 'Eメールが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'test', email: '', password: 'password', password_confirmation: 'password')
        expect(user).not_to be_valid
      end
    end

    context 'アカウント新規登録' do
      it 'アカウントの新規登録ができる。' do
        user = User.new(name: 'test', email: 'lisa@test.com', password: 'password', password_confirmation: 'password')
        expect(user).to be_valid
      end
    end

    context '名前が空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: '', email: 'lisa@text.com', password: 'password', password_confirmation: 'password')
        expect(user).not_to be_valid
      end
    end

    context 'パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'test', email: '', password: '', password_confirmation: 'password')
        expect(user).not_to be_valid
      end
    end
  end
end