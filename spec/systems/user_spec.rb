require 'rails_helper'
RSpec.describe 'User関連機能',type: :system do
  before do
    admin_user = User.find_by(email: FactoryBot.build(:user).email) || FactoryBot.create(:user)
    normal_user = FactoryBot.create(:user2)
    visit root_path
  end

  describe 'devise関連機能' do
    context '全ての入力が正しい場合' do
      it 'サインアップできる' do
        # binding.irb
        click_on "新規登録"
        fill_in "user[name]", with: "sarah"
        fill_in "user[email]", with: "sarah@gmail.com"
        fill_in "user[password]", with: "sarah1234"
        fill_in "user[password_confirmation]", with: "sarah1234"
        sleep(0.5)
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context '入力漏れが合った場合' do
      it 'サインアップできない' do
        click_on 'ログイン'
        fill_in "user[name]", with: "may"
        fill_in 'user[email]',with: 'may@yahoo.com'
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
        expect(page).to have_content "Eメール、名前またはパスワードが違います。"
      end
    end
    context '全ての入力が正しい場合' do
      it 'ログインできる' do
        click_on 'ログイン'
        fill_in "user[name]", with: "may"
        fill_in 'user[email]',with: 'may@yahoo.com'
        fill_in 'user[password]', with: 'may1234'
        # find('ログイン').find_link('.btn btn-primary').click
        # click_button 'ログイン'
        click_button 'commit'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'emailとpasswordが一致しない場合' do
      it 'ログインできない' do
        click_on 'ログイン'
        fill_in "user[name]", with: "lisa"
        fill_in 'user[email]',with: 'lisa@gmail.com'
        fill_in 'user[password]', with: 'paris1234'
        click_button 'ログイン'
        expect(page).to have_content 'Eメール、名前またはパスワードが違います。'
      end
    end
  end
end

