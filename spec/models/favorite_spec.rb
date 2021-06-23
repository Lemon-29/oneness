require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'バリデーションのテスト' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:post) { FactoryBot.create(:post) }

    context 'USER_IDが空の場合' do
      it 'バリデーションにひっかる' do
        favorite = Favorite.new(user_id: nil, post_id: post.id)
        expect(favorite).not_to be_valid
      end
    end

    context 'POST_IDが空の場合' do
      it 'バリデーションにひっかる' do
        favorite = Favorite.new(user_id: user.id, post_id: nil)
        expect(favorite).not_to be_valid
      end
    end

    context '全てが空の場合' do
      it 'バリデーションにひっかる' do
        favorite = Favorite.new(user_id: nil, post_id: nil)
        expect(favorite).not_to be_valid
      end
    end

    context 'USER_IDとPOST_IDが入力された場合' do
      it 'バリデーションが通る' do
        favorite = Favorite.new(user_id: user.id, post_id: post.id)
        expect(favorite).to be_valid
      end
    end
  end
end
