## タイトル /title
### 『Oneness』
## コンセプト/concept/ 
#### ヨギーにのためのプラットフォーム/This app is for all yoga loves to be oneness 
コロナ禍になり、ワークアウトの環境ですら大きな変化がありました。
ヨガを愛する私もまたその1人です。
このような状況で私が通っていたヨガスタジオもオンライに切り替わり、有難いことにヨガをする機会を見逃さなかったものの
そこで何かsnsというツールを通して、繋がれるものが必要だと考えるようになりました。
1人でヨガをしていては誰もポーズをみてくれない、1人で続けていくモチベーション、同じシークエンスを一緒にやって生まれるあのスタジオの空間を取り戻すことができます。
また、オンラインになったこそ、ならではでポーズの写真や日記などで振り返る時間ができる、新しいヨガの様式を楽しむことができます。
Since covid-19 our lives have been so much changes.
It varies corona's lives depending on the country so some coutries are even difficult workout.
I've been doing yoga , let's say "as a yoggy" more than 10 years. Even my yoga sutudio had to close during quarantine.

My yoga teacher has created online yoga studio immediately. Lucky for me I didn't miss any oppotunities of my workout because of her.
At the biggining of onlin studio, I felt a little bit wired because basically doing yoga with friends , teacher but doing yoga at my apartment by myself is kinda lonly and I felt isolated from the world. Sounds like over reacted but truth is it does.
Tha't why I've been thinkig I wanna make something to connect all yoga loves.
So when you do yoga  by yourself , No one can see your yoga and feelings so Best Yoga App For All Levels here.
You can connct your favorite ppl, yoga pose and post your dialy, don'
## バージョン/version
* Ruby2.6.5
* Rails5.2.5
* PostgreSQL13.3
## 機能一覧/list of functions
* gameのCRUD機能(投稿・画像、編集、削除)
* gameの作成・登録機能
* gameのお気に入り機能
* お気に入り一覧表示機能
* コメント機能
* ユーザー登録機能
* ユーザー管理機能
* ログイン機能
* ゲストログイン機能
* フォロー機能
* 管理者権限機能
* game検索機能
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
<img src=“./public/images/ERmapping.png” alt=“ER図” width=‘650px’>
## 画面遷移図
<img src=“./public/images/STDiagram.png” alt=“画面遷移図” width=‘650px’>