require 'rails_helper'
RSpec.describe '投稿機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:post) { FactoryBot.create(:post) }
  let!(:post2) { FactoryBot.create(:post2) }

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
end