

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
    let!(:user) { FactoryBot.create(:user, name:"momo", email:"momo@gmail.com", password:"momo1234", password_confirmation:"momo1234")}
    let!(:user2) { FactoryBot.create(:user2) }
    let!(:post) { FactoryBot.create(:post, user_id:user.id) }
    let!(:post2) { FactoryBot.create(:post2, user_id:user2.id) }
    let!(:favorite) { FactoryBot.create(:favorite, post_id:post2.id, user_id:user.id) }
    let!(:post3) { FactoryBot.create(:post3, user_id:user2.id) }


    before do
      visit root_path
      # visit new_user_session_path
      click_link 'ログイン'
      fill_in "user[name]",	with: "momo"
      fill_in "user[email]",	with: "momo@gmail.com"
      fill_in "user[password]",	with: "momo1234"
      click_on "commit"
    end

    context 'ログインしたユーザーが他人のポスト詳細ページにきたとき' do
      it 'お気に入り登録ができる' do
        show_btns = all(".posts-index_list-item_right-button")
        show_btns[0].click
        sleep 0.5
        click_on 'お気に入り追加'
        expect(page).to have_content 'お気に入りに追加しました！'
      end
    end

    context 'ログインしたユーザーがお気に入りした一覧にいったとき' do
      it '以前お気に入りした投稿の解除ができる。' do
        show_btns = all(".posts-index_list-item_right-button")
        show_btns[1].click
        sleep 0.5
        click_on 'お気に入り解除'
        expect(page).to have_content 'お気に入りを解除しました！'
      end
    end
    context 'ログインユーザーが投稿をお気に入り登録をした場合' do
      it 'お気に入り一覧でその投稿を表示することができる。' do
        # FactoryBot.create(:user, name:"momo", email:"momo@gmail.com", password:"momo1234", password_confirmation:"momo1234")
        # visit root_path
        # # visit new_user_session_path
        # click_link 'ログイン'
        # fill_in "user[name]",	with: "momo"
        # fill_in "user[email]",	with: "momo@gmail.com"
        # fill_in "user[password]",	with: "momo1234"
        # click_on "commit"
        # visit posts_path
        
        
        click_link "BOOKMARK"
        expect(page).to have_content  '＿/＿/＿/momoお気に入り一覧画面＿/＿/＿/'
        expect(page).to have_content  'may さんの投稿'
      end
    end
  end
end

