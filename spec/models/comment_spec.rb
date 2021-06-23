require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    let!(:comment) { FactoryBot.create(:comment }
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:post) { FactoryBot.create(:post) }
    let!(:post2) { FactoryBot.create(:post2) }

    context 'コメントが空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: '', comment_id: comment.id)
        expect(comment).not_to be_valid
      end
    end

    context 'コメントが1001文字以上の場合' do
      it 'バリデーションにひっかる' do
        content = "0" * 1001
        comment = Comment.new(content: '', comment_id: user.id)
        expect(post).not_to be_valid
      end
    end

    context 'Scoreとコメントが空の場合' do
      it 'バリデーションにひっかる' do
        post = Comment.new(comment: '', score_id: score.id)
        expect(comment).not_to be_valid
      end
    end

    context '全てが空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: nil, score: nil, user_id: nil)
        expect(comment).not_to be_valid
      end
    end

