require 'rails_helper'
RSpec.describe '投稿機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:post) { FactoryBot.create(:post, user_id:user.id) }
  let!(:post2) { FactoryBot.create(:post2, user_id:user2.id) }


  describe '一覧表示機能' do
    before do
      visit new_user_session_path
      click_link 'sessions-new_guest'
      visit posts_path
    end

    context '一覧画面に遷移した場合' do
      it '作成済みの投稿が一覧に表示される' do
        # 表示されてて欲しいPost
        post = Post.last
        # 要素が存在するかをidで検索して、present?メソッドを利用してテストを通す
        element = find("#posts-index_list-#{post.id}")
        expect(element.present?).to eq true

        # 要素が存在するかをコンテンツのidで検索して、コンテンツの中身が合っているかを見る
        element2 = find("#posts-index_list-#{post.id}_content")
        expect(element2).to have_content post.content # WARNING: 文字列を直入力せずに、FindやFactoryBotなどを利用して取得した変数を打ち込む

        #  コンテンツ以外のプロパティーも書くとさらにテストは強固になる。
        element3 = find("#posts-index_list-#{post.id}_user_name")
        expect(element3).to have_content post.user.name
      end
    end

    context '作成日時の降順に並んでいる場合' do
      it '新しい投稿が一番上に表示される' do
        # 順番や複数の要素を使いたい時はclassを使ってallなどで配列で取得します
        post_list = all('.posts-index_list-item')
        # 今回は一番上に表示されているかどうかを知りたい = 配列の一番上に欲しいHTMLがあれば良い
        raw = post_list.first
        post = Post.last
        element = find("#posts-index_list-#{post.id}")
        expect(raw).to eq element

        # 順番や複数の要素を使いたい時はclassを使ってallなどで配列で取得します
        # この方法では取得した配列の一番上の要素にきて欲しいpost.contentがあるかを確かめたい
        # だからcontentを表示しているclassで配列で取得する
        post_content_list = all('.posts-index_list-item_right-content')
        # ↓この要素が一番上に表示されているcontentを持っている
        content_raw = post_list.first
        # ↓このPostが一番上に表示して欲しいcontentを持っている
        post = Post.last
        expect(content_raw).to have_content post.content
      end
    end
  end

  describe '新規投稿機能' do
  #   before do
  #     visit new_user_session_path
  #     click_link 'sessions-new_guest'
  #     visit new_post_path
  #   end
  
  context 'postの詳細画面からコメントと星のreviewが投稿できること' do
    it '問題なくコメントと星が投稿できる', js: true do
      
      
      visit new_user_session_path
      click_link 'sessions-new_guest'
      visit posts_path
      # all('div a')[10].click #特定のpostの詳細に移動
      all('div a')[10].click #特定のpostの詳細に移動
      fill_in "comment[content]", with: "test comment"
      score = find('.app-score')#コメント投稿欄から星のボタンを見つけて変数に格納
      score.all("img")[2].click #score変数に入っている星のボタンから3番目に入っている星の画像をクリック
      click_on "登録する"
      
      expect(page).to have_content "test comment"
    end
  end
  end
end





# TEST PATTERN ( ONLY SUCCESS )
# - INDEX ○
#   - ALREADY SAVED POST DISPLAY IN THE LIST ○
#   - CHECK ID DESC IN THE LIST ○
# - NEW & CREATE
#   - BEFORE: LOGIN AND GO TO NEW
#   - INPUT FORM AND SUBMIT
# - SHOW
#   - BEFORE: LOGIN AND GO TO SOME POST SHOW PAGE
#   - CHECK ELEMENT EXISTS AND HAVE_CONTENT CONTENT, USERNAME
# - EDIT & UPDATE
#   - BEFORE: LOGIN AND GO TO SOME SHOW PAGE
#   - CHECK EDIT BUTTON SHOW AND CLICK GO TO EDIT PAGE => INPUT FORM AND SUBMIT
# - DESTROY
#   - BEFORE: LOGIN AND GO SOME POST SHOW PAGE
#   - CHECK DESTROY BUTTON SHOW AND CLICK CAN DESTROY
