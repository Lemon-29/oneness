require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user2) }
    let!(:post) { FactoryBot.create(:post, user_id:user.id) }
    let!(:post2) { FactoryBot.create(:post2, user_id:user2.id) }


    context 'コメントが空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: '', score: 1.0, user_id: user.id, post_id: post.id)
        expect(comment).not_to be_valid
      end
    end

    context 'コメントが1001文字以上の場合' do
      it 'バリデーションにひっかる' do
        content = "0" * 1001
        comment = Comment.new(content: content, score: 1.0, user_id: user.id, post_id: post.id)
        expect(comment).not_to be_valid
      end
    end

    context 'Scoreとコメントが空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: '', score: nil, post_id: post.id)
        expect(comment).not_to be_valid
      end
    end

    context 'USER_IDが空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: 'test', score: 1.1, user_id: nil, post_id: post.id)
        expect(comment).not_to be_valid
      end
    end

    context 'POST_IDが空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: 'test', score: 1.1, user_id: user.id, post_id: nil)
        expect(comment).not_to be_valid
      end
    end

    context '全てが空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: nil, score: nil, user_id: nil, post_id: nil)
        expect(comment).not_to be_valid
      end
    end

    context 'USER_IDとPOST_IDとコンテンツとスコアが入力された場合' do
      it 'バリデーションが通る' do
        comment = Comment.new(content: 'test', score: 1.1, user_id: user.id, post_id: post.id)
        expect(comment).to be_valid
      end
    end
  end
end
