## タイトル /title
### 『Oneness』
## コンセプト/concept/ 
#### ヨギーにのためのプラットフォーム/This app is for all yoga loves to be oneness 

      このアプリはヨギーにのためのプラットフォームです。<br>
      stay homeでworkoutの環境ですら大きな変化がありました。
      1人でヨガをしていては誰もポーズをみてくれない、1人で続けていくモチベーション、
      同じシークエンスを一緒にやって生まれるあのスタジオの空間を取り戻すことができます。 <br>
      また、オンラインになったこそ、ポーズの写真や日記などで振り返る時間ができて
      かつヨギーたちとのつながりを楽しむ、新しいヨガの様式を体験できます。<br>


      This app is for all yoga loves to be oneness
      When you do yoga by yourself ,  No one can see your yoga. Do you feel isolated ? No worries.<br>
       Best App is For All YOGA Lovers here.
       You can connct your favorite people, post your yoga pose and write your daily dialy as well, don't need to feel lonly anymore! Let's get started!!
* Ruby2.6.5
* Rails5.2.5
* PostgreSQL13.3
## 機能一覧/list of functions
* yogaのCRUD機能(投稿・画像、編集、削除)
* yogaのお気に入り機能
* お気に入り一覧表示機能
* コメント機能
* ユーザー登録機能
* ユーザー管理機能
* ログイン機能
* ゲストログイン機能
* フォロー機能
* 管理者権限機能
* rating (評価機能）
* Heroku
## 実行手順/how to proceed
````
$ git clone git@github.com:Lemon-29/oneness.git
$ cd oneness
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
````
## カタログ設計/Catalog settings 
https://docs.google.com/spreadsheets/d/1vd26jzxgAcfNBPxDwTgIRl1KDNvq_2KfB1jWiLHHc9Q/edit?usp=sharing
## テーブル定義・ER図/table definition,ER_diagram
https://docs.google.com/spreadsheets/d/1vd26jzxgAcfNBPxDwTgIRl1KDNvq_2KfB1jWiLHHc9Q/edit?usp=sharing
## ワイヤーフレーム/wire-flame
https://docs.google.com/spreadsheets/d/1vd26jzxgAcfNBPxDwTgIRl1KDNvq_2KfB1jWiLHHc9Q/edit?usp=sharing

## ER図
![Screen Shot 2021-06-25 at 2 04 57](https://user-images.githubusercontent.com/77761510/123360794-e188e800-d5a8-11eb-96a8-a539b8afd646.png)

## 画面遷移図
![Screen Shot 2021-06-25 at 10 56 52](https://user-images.githubusercontent.com/77761510/123360744-ca49fa80-d5a8-11eb-96e1-d112d06e4e22.png)

