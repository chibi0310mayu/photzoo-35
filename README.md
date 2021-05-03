# README
## アプリケーション名
# photzoo

[![Image from Gyazo](https://i.gyazo.com/99951cb07568b3dd3baa9231bc7c8785.jpg)](https://gyazo.com/99951cb07568b3dd3baa9231bc7c8785)

## アプリケーション概要

自分の写真を出品してうることができる

お気に入りの写真を買うことができる

## テスト用アカウント
アカウント１ 

 email = 123@abc

 password = 123abc

アカウント２

 email = 456@deg

 password = 456deg

 テストカード番号 = 4242424242424242

CVC = 123

有効期限 = 登録時より未来


 ## 利用方法
 新規登録、ログインして出品ボタンをおして各項目を記入して出品ボタンをおせば出品できます

 商品一覧画面をクリックすれば詳細画面になり、編集、削除が可能です

 自分が出品してない詳細画面には購入ボタンがありそこをクリックすれば購入画面になります。

 まだ購入機能は未実装です。

 # 目指した課題解決

 動物園の動物好きの方のためのアプリになります。

 動物園の動物好きのかたは、例えばレッサーパンダ好きの方は多摩動物公園のレッサーパンダの〇〇君のファンだったりします。しかし、繁殖の為に他の動物園へ移動になる事が多いです。

 その動物園が近場ならば良いのですが、北海道や鹿児島、沖縄などの場合もあります。

 気軽にいけない人たちは、SNSで近況報告など情報を集めております。そんな人たちの中には「最近の写真がみれてよかった」などのコメントをみかけます。

 その言葉の裏には「欲しいけど著作権が・・」などの思いもありと思いました。

 あと、こちらは動物園のためにもなると思いました。

 お客さんは個体別のグッズを求めているのですが、なかなか個体別のグッズを展開してる動物園は少ないです。

 個体別のグッズを出せば売上があがると思いますが、その時問題になるのがカメラマンです。

 雇うとなると費用がかさむのでその時にこのアプリなどで写真を購入してグッズを制作すれば生産コストが下げられ売上もあがると思いました。

 写真の著作権法など細かいことがあると思いますが、思いついたので作ってみました。

 ## 洗い出した要件
 
 データベース設計

 ユーザー管理機能

 商品出品機能

 商品一覧機能

 商品詳細機能

 商品削除

 商品購入機能

 コメント機能

## 実装予定の機能

コメント機能

## 実装した機能紹介

新規写真出品方法

右下の出品するボタンをクリック

[![Image from Gyazo](https://i.gyazo.com/99951cb07568b3dd3baa9231bc7c8785.jpg)](https://gyazo.com/99951cb07568b3dd3baa9231bc7c8785)


そうすると以下の画面に以降します
[![Image from Gyazo](https://i.gyazo.com/7fa67cba9ba3c3ad72ecb3ba8002daa1.gif)](https://gyazo.com/7fa67cba9ba3c3ad72ecb3ba8002daa1)

「写真の動物名」
を入力
「写真の動物説明」
を入力
[![Image from Gyazo](https://i.gyazo.com/4a0c3b725afe923b0dce09f0ac1903c1.png)](https://gyazo.com/4a0c3b725afe923b0dce09f0ac1903c1)

動物園の地域選択、
動物の種類、
配送料の負担、
配送元地域、
配送までの日数、
価格を入社
[![Image from Gyazo](https://i.gyazo.com/205faa3bedebca37edef087e468a870e.png)](https://gyazo.com/205faa3bedebca37edef087e468a870e)
出品するボタンを押すと出品できます。
出品した写真は一覧画面に表示
[![Image from Gyazo](https://i.gyazo.com/5d4cfe35499409327b0e7777a73a352d.gif)](https://gyazo.com/5d4cfe35499409327b0e7777a73a352d)

出品した画像をクリックすると商品詳細ページに移行して
編集と削除が可能です

[![Image from Gyazo](https://i.gyazo.com/e9cf587d77b942bbe6a59dcff013b18f.gif)](https://gyazo.com/e9cf587d77b942bbe6a59dcff013b18f)

他の人の出品写真は購入ボタンがあり購入できます。
[![Image from Gyazo](https://i.gyazo.com/25b6c70d90caa9d129ddf287da8c3e5d.gif)](https://gyazo.com/25b6c70d90caa9d129ddf287da8c3e5d)

テストカード用のカード番号、cvc,有効期限は現在より未来
を入力して購入機能ボタンを押せば購入できます。
購入後の一覧画面にがsoudoutが表示されます。
[![Image from Gyazo](https://i.gyazo.com/e4d9b11c38b7de285829708f901cf414.gif)](https://gyazo.com/e4d9b11c38b7de285829708f901cf414)

## データベース設計


## ローカルでの動作方法







# テーブル設計



## usersテーブル
(devise)使用

| column            | Type     | Options               |
| ----------------- | -------- | --------------------- |
| email             | string   | NOT NULL  unique: true|
| encrypted_password| string   | NOT NULL              |
| nickname          | string   | NOT NULL              |
| family_name       | string   | NOT NULL              |
| fist_name         | string   | NOT NULL              |
| family_name_kana  | string   | NOT NULL              |
| fist_name_kana    | string   | NOT NULL              |
| birthdate         | date     | NOT NULL              |


### Association
- has_many :photos
- has_many :purchase
- has_many :comments




## addressesテーブル

| column          | Type      | Options                     |
|-----------------|-----------|-----------------------------|
| post_code       | string(7) | NOT NULL                    |
| area_id         | integer   | NOT NULL                    |
| city            | string    | NOT NULL                    |
| home_num        | string    | NOT NULL                    |
| building_name   | string    |                             |
| tel             | string    | NOT NULL                    |
| purchase        | references| foreign_key: true NOT NULL  |

### Association
- belongs_to : purchase 

## prefecture
(active_hash)使用



## photosテーブル

| column          | Type     | Options         |
|-----------------|----------|-----------------|
| name            | string   | NOT NULL        |
| explanation     | text     | NOT NULL        |
| condition_id    | integer  | NOT NULL                   
| burden_id       | integer  | NOT NULL                   |
| area_id         | integer  | NOT NULL                   |
| shipping_id     | integer  | NOT NULL                   |
| price           | integer  | NOT NULL                   |
| user            |references|foreign_key: true NOT NULL  |
### Association
- belongs_to : user
- belongs_to : condition
- belongs_to : burden
- belongs_to : area
- belongs_to : shipping
- has_one_attached : image
- has_one : purchase
- has_many :comments
## category
## condition
## burden
## area
## shipping
(active_hash)使用


## imageテーブル
(ActiveStorage)を使用



## purchasesテーブル

| column          | Type     | Options                   |
|-----------------|----------|---------------------------|
| phot            |references| foreign_key: true NOT NULL|
| user            |references| foreign_key: true NOT NULL|

### Association
- has_one : address
- belongs_to : user
- belongs_to : photo


## commentsテーブル

| column          | Type     | Options                   |
|-----------------|----------|---------------------------|
| photo           |references| foreign_key: true NOT NULL|
| user            |references| foreign_key: true NOT NULL|
| text            | text     | NOT NULL

### Association
- belongs_to : user
- belongs_to : photo
