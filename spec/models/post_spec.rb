require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションのテスト' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:post) { FactoryBot.create(:post) }
    let!(:post2) { FactoryBot.create(:post2) }

    context 'コンテンツが空の場合' do
      it 'バリデーションにひっかる' do
        post = Post.new(content: '', image: File.open("./app/assets/images/pose1-1.jpg"), user_id: user.id)
        expect(post).not_to be_valid
      end
    end

    context 'コンテンツが1001文字以上の場合' do
      it 'バリデーションにひっかる' do
        content = "0" * 1001
        post = Post.new(content: '', image: File.open("./app/assets/images/pose1-1.jpg"), user_id: user.id)
        expect(post).not_to be_valid
      end
    end

    context '画像が空の場合' do
      it 'バリデーションにひっかる' do
        post = Post.new(content: 'aaaa', image: nil, user_id: user.id)
        expect(post).not_to be_valid
      end
    end

    context '画像とコンテンツが空の場合' do
      it 'バリデーションにひっかる' do
        post = Post.new(content: '', image: nil, user_id: user.id)
        expect(post).not_to be_valid
      end
    end

    context 'USER_IDが空の場合' do
      it 'バリデーションにひっかる' do
        post = Post.new(content: 'aaaa', image: File.open("./app/assets/images/pose1-1.jpg"), user_id: nil)
        expect(post).not_to be_valid
      end
    end

    context '全てが空の場合' do
      it 'バリデーションにひっかる' do
        post = Post.new(content: nil, image: nil, user_id: nil)
        expect(post).not_to be_valid
      end
    end

    context 'USER_IDとコンテンツと画像が入力された場合' do
      it 'バリデーションが通る' do
        post = Post.new(content: 'aaaa', image: File.open("./app/assets/images/pose1-1.jpg"), user_id: user.id)
        expect(post).to be_valid
      end
    end
  end
end
