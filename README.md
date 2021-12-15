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
