

# TEST PATTERN ( ONLY SUCCESS )
# - INDEX
#   - ALREADY SAVED POST DISPLAY IN THE LIST
#   - CHECK ID DESC IN THE LIST
# - CREATE
#   - BEFORE: LOGIN AND GO TO SOME POST SHOW PAGE
#   - CLICK FAVORITE BUTTON THEN CHECK RECORD AND CORRECT PAGE TRAMSITION
# - DESTROY
#   - BEFORE: LOGIN AND GO TO SOME FAVORITED POST SHOW PAGE
#   - CLICK DESTROY FAVORITE BUTTON THEN CHECK DESTROY RECORD AND CORRECT PAGE TRAMSITION
require 'rails_helper'

RSpec.describe 'お気に入り機能', type: :system do
  describe 'お気に入り登録' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user2) }
    let!(:post) { FactoryBot.create(:post) }

    before do
      visit new_user_session_path
      click_link 'sessions-new_guest'
      visit post_path(id: post.id)
    end

    context 'ログインしたユーザーが他人のポスト詳細ページにきたとき' do
      it 'お気に入り登録ができる' do
        click_on 'お気に入り追加'
        expect(page).to have_content '気に入りに追加しました！'
      end
    end
  end
  describe 'お気に入り登録一覧表示' do
    context 'ログインユーザーが投稿をお気に入りにしたとき' do
      it 'お気に入り一覧で表示することができる。' do
        @user2 = FactoryBot.create(:user2, user_id: @user.id)
        visit new_user_session_path
        fill_in "メールアドレス", with: "user2@example.com"
        fill_in "パスワード", with: "password2"
        within '.actions' do
          click_on 'ログイン'
        end
        click_on 'お気に入り追加'
        click_on ' BOOKMARK'
        expect(page).to have_content 'BOOKMARK'
        expect(page).to have_content 'user_faborites'
      end
    end
  end
end

# お気に入り解除のテストを実装