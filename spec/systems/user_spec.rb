


# TEST PATTERN ( ONLY SUCCESS )
# - DEVICE AUTHENTICATE
#   - LOGIN
#   - SIGN UP
#   - GUEST LOGIN ( only click link )
#   - ADMIN LOGIN ( only click link )
# - INDEX
#   - ALREADY SAVED POST DISPLAY IN THE LIST
#   - CHECK ID DESC IN THE LIST

require 'rails_helper'
RSpec.describe 'User関連機能',type: :system do
  let!(:user){create(:user)}
  before do
    visit root_path
  end
  describe 'devise関連機能' do
    context '全ての入力が正しい場合' do
      it 'サインアップできる' do
        find('#sign_up').click
        fill_in "user[name]", with: "saaya"
        attach_file 'user[image]', 'public/images/saaya.jpeg'
        fill_in "user[email]", with: "test@saaya.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        sleep(0.5)
        click_button 'ログイン'
        expect(page).to have_content '写真一覧画面'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context '入力漏れが合った場合' do
      it 'サインアップできない' do
        find("#sign_up").click
        click_button 'commit'
        expect(page).to have_content "Eメール、Nameまたはパスワードが違います。"
      end
    end
    context '全ての入力が正しい場合' do
      it 'ログインできる' do
        find("#log_in").click
        fill_in 'user[email]',with: 'snoopy@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'commit'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'emailとpasswordが一致しない場合' do
      it 'ログインできない' do
        find("#log_in").click
        fill_in 'user[email]',with: 'snoopy@gmail.com'
        fill_in 'user[password]', with: 'wrong password'
        click_button 'commit'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
        expect(current_path).to have_content '/users/sign_in'
      end
    end
    describe 'ログイン後' do
      context 'ログアウトした場合' do
        it  'トップページに戻りログアウトのmsgが表示される' do
          visit root_path
          find("#log_in").click
          fill_in 'user[email]',with: 'snoopy@gmail.com'
          fill_in 'user[password]', with: 'password'
          click_button 'commit'
          expect(page).to have_content 'ログインしました。'
          click_on 'ログアウトしました。'
          expect(page)
        end
      end
    end
  end
end

# アカウント削除(解約)のテスト
# User情報編集のテスト
# 