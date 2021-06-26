

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
    let!(:user) { User.create(name:"momo", email:"momo@gmail.com", password:"momo1234")}
    let!(:user2) { FactoryBot.create(:user2) }
    let!(:post) { FactoryBot.create(:post, user_id:user.id) }
    let!(:post2) { FactoryBot.create(:post2, user_id:user2.id) }
    let!(:favorite) { FactoryBot.create(:favorite, post_id:post.id, user_id:user2.id) }

    before do
      visit root_path
      # visit new_user_session_path
      click_link 'ログイン'
  
      fill_in "user[name]",	with: "momo" 
      fill_in "user[email]",	with: "momo@gmail.com" 
      fill_in "user[password]",	with: "momo1234" 
      # visit post_path(id: post.id)
      click_on "commit"
    end

    context 'ログインしたユーザーが他人のポスト詳細ページにきたとき' do
      it 'お気に入り登録ができる' do
        binding.pry
        find_by_id("posts-index_list-#{post.id}_show").click
        click_on 'BOOKMARK'
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

