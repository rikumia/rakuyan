# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many  :works
- has_many  :cliants
- has_many  :cost_pdfs

## worksテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| cliant_name          | string     | null: false                    |
| job_description      | text       | null: false                    |
| calendar             | date       | null: false                    |
| work_place           | string     | null: false                    |
| price                | integer    | null: false                    |

### Association

- has_many  :cliants
- has_many  :costs
- belongs_to  :user

## costsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| work               | references | null: false, foreign_key: true |
| sales              | integer    | null: false                    |
| cost               | integer    | null: false                    |
| tax                | integer    | null: false                    |
| profit             | integer    | null: false                    |

### Association

- belongs_to  :work

## cliantsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| work               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| cliant_name        | string     | null: false                    |
| email              | string     | null: false                    |
| tell               | string     | null: false                    |
| fax                | string     | null: false                    |
| address            | string     | null: false                    |

### Association

- belongs_to  :work
- belongs_to  :user

## cost_pdfテーブル

 | Column            | Type       | Options                        |
 | ------------------| ---------- | ------------------------------ |
 | user_id           | references | null: false, foreign_key: true |
 | cliant_name       | string     | null: false                    |
 | postal_code       | integer    | null: false                    |
 | address           | string     | null: false                    |
 | comoany_name      | string     | null: false                    |
 | tell              | string     | null: false                    |
 | fax               | string     | null: false                    |
 | delivery_date     | string     | null: false                    |
 | delivery_location | string     | null: false                    |
 | payment_terms     | string     | null: false                    |
 | expiration_date   | string     | null: false                    |
 | product_name      | string     | null: false                    |
 | quantity          | integer    | null: false                    |
 | unit              | integer    | null: false                    |
 | unit_price        | integer    | null: false                    |
 | money             | integer    | null: false                    |
 | remarks           | string     | null: false                    |
 | subtotal          | integer    | null: false                    |
 | tax               | integer    | null: false                    |
 | total             | integer    | null: false                    |
 | remarks           | string     | null: false                    |

  ### Association

  - belongs_to  :user

| 記述すること                  |    備考                                                                                                 |
| --------------------------- | ------------------------------------------------------------------------------------------------------ |
| アプリケーション名             | rakuyan                                                                                                |
| アプリケーション概要           | 個人事業主向けの業務管理アプリ                                                                              |
| URL                         | https://rakuyan.herokuapp.com/                                                                         |
| テスト用アカウント             | ・メールアドレス:ss@ddd                                                                                   |
|                             |   ・パスワード:aaaaa1                                                                                    |
|                             |   ・Basic認証:  id:rikumia                                                                              |
|                             |                Pass:77915                                                                              |
| 利用方法                     | ー1.新規登録ページで登録を行います。
                                2.一覧ページから仕事管理、顧客管理、売上管理のそれぞれに遷移します。 3.各一覧ページから各登録ページに遷移して入力します。 4.各一覧ページから見積書ページに遷移でき見積書作成を行います。                                                    |
|
|
|
|                                5.見積書のPDFアイコンをクリックすると、入力した内容のPDFが表示されます。
| アプリケーションを作成した背景   | 私の父や親戚、友人などが個人事業主を営んでおり、その中で業務の管理
|                               などをアナログで行うことが多く、今現在世の中にあるアプリケーションの
|                               使い方が難しくて使いこなせないと言う意見が多かったので、比較的わかりやすくて使いやすいアプリケーションを
|                               開発してみることにしました。
| 洗い出した要件                | https://docs.google.com/spreadsheets/d/1uBlmvkv5ps7qJ7c9R5SKv7LFzTpSI_VWBV-tDU21JVY/edit#gid=982722306
| 実装した機能についての画像や    |
|  GIFおよびその説明            |
| 実装予定の機能                | レスポンシブ化がうまくできていないのと、一度入力したところの情報を
|                               そのまま持って来れるようにしたいです。
| データベース設計              |
| 画面遷移図                   |
| 開発環境                     | ・フロントエンド: HTML,CSS/javascript/Bootstrap
|                               ・バックエンド: Ruby(ver 2.6.5) / Ruby on Rails(ver 6.0.0)
|                              ・テキストエディタ: Visual Studio Code
|                            |  ・タスク管理: GitHubプロジェクトボード
| ローカルでの動作方法           | 以下、コマンドを順に実行してください。
|                            |   % git clone https://github.com/rikumia/rakuyan.git
|                            |   % cd
|                            |   % bundle install
|                            |   % yarn install
