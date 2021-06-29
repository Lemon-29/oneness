require 'rails_helper'
RSpec.describe 'Admin', type: :system do

  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }
  # let!(:post) { FactoryBot.create(:post, user_id:user.id) }
  let!(:post2) { FactoryBot.create(:post2, user_id:user2.id) }
  let!(:favorite) { FactoryBot.create(:favorite, post_id:post2.id, user_id:user.id) }
  let!(:comment) { FactoryBot.create(:comment, post_id:post2.id, user_id:user.id) }
  # let!(:user2) { FactoryBot.create(:user2) }
  # let!(:user2) { FactoryBot.create(:user2) }
  describe '管理者機能' do
    # before do 
    #   visit root_path
    #   click_on "ログイン"
    #   click_on '管理者ログイン'
    #   click_on '管理者画面'
    # end
  
    context '管理者の場合,' do
      it '管理者ページにアクセスできて、投稿の削除ができる。' do
        visit root_path
        click_on "ログイン"
        click_on '管理者ログイン'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
        first('.nav-pills').find_link('投稿').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('削除').click
        click_on('実行する')
        expect(page).to have_content '投稿の削除に成功しました'
      end
    end
    context '管理者の場合,' do
      it '管理者のページにアクセスできて、お気に入りの削除することができる' do
        visit root_path
        click_on "ログイン"
        click_on '管理者ログイン'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
        first('.nav-pills').find_link('お気に入り').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(7)').find(".list-inline").find_link('削除').click
        click_on('実行する')
        expect(page).to have_content 'お気に入りの削除に成功しました'
      end
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできて投稿の編集ができる' do
        visit root_path
        click_on "ログイン"
        click_on '管理者ログイン'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
        first('.nav-pills').find_link('投稿').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
        find_by_id('post_content').set "編集しましたよ〜〜〜"
        click_button '保存'
        expect(page).to have_content '投稿の更新に成功しました'
      end
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできて、コメントの編集ができる' do
        visit root_path
        click_on "ログイン"
        click_on '管理者ログイン'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
        first('.nav-pills').find_link('コメント').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
        find_by_id('comment_content').set "I DID edit her comment!"
        click_button '保存'
        expect(page).to have_content 'コメントの更新に成功しました'
      end
    end


    context '管理者の場合,' do
      it '管理者ページにアクセスできてコメントの削除ができる。' do
        visit root_path
        click_on "ログイン"
        click_on '管理者ログイン'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
        first('.nav-pills').find_link('コメント').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('削除').click
        click_on('実行する')
        expect(page).to have_content 'コメントの削除に成功しました'
      end
    end
  end
  describe '管理者ログイン' do
    context '管理者の場合,' do
      it '管理者ページにログインできる。' do
        visit root_path
        click_on "ログイン"
        sleep(0.5)
        click_on '管理者ログイン'
        expect(page).to have_content '管理者ユーザーとしてログインしました。'
      end
    end
    
    context '管理者でない場合,' do
      it '管理者ページにはアクセスできない' do
        visit root_path
            
        click_on "ログイン"
        fill_in :user_name, with: 'may'
        fill_in :user_email, with: 'may@yahoo.com'
        fill_in :user_password, with: 'may1234'
        click_button 'commit'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_no_content '管理者ログイン'
      end
    end
    
    
    context 'ログイン画面の管理者ゲストユーザーボタンから' do
      it '管理者ページに遷移できる' do
      visit root_path
      click_on "ログイン"
      click_link 'ゲストログイン（閲覧用）'
      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      expect(page).not_to have_content '管理者画面'
      end
    end
    
    context 'ログイン画面の管理者ゲストユーザーボタンから' do
      it '管理者ページに遷移できる' do
      visit root_path
      click_on "ログイン"
      click_on "管理者ログイン"
      expect(page).to have_content '管理者ユーザーとしてログインしました。'
      expect(page).to have_content '管理者画面'
      click_on '管理者画面'
      expect(current_path).to eq rails_admin_path
      end
    end
    
    context 'ログイン画面の管理者ゲストユーザーボタンから' do
      it '管理者ページに遷移できる' do
      visit root_path
      click_on "ログイン"
      click_link 'ゲストログイン（閲覧用）'
      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      expect(page).not_to have_content '管理者画面'
      end
    end
  end
end
