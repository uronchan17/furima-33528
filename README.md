# テーブル設計

## users テーブル

| Column             | Type    | Option                   |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false unique: true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birthday           | date    | null: false              |

### Association

- has_many :product_purchases_users
- has_many :product_listings

## product_listings テーブル

| Column          | Type       | Option                       |
| --------------- | ---------- | ---------------------------- |
| product_name    | string     | null: false                  |
| explain         | text       | null: false                  |
| category_id     | integer    | null: false                  |
| state_id        | integer    | null: false                  |
| delivery_fee_id | integer    | null: false                  |
| area_id         | integer    | null: false                  |
| date_id         | integer    | null: false                  |
| fee             | integer    | null: false                  |
| user            | references | null: false foreign_key: true|

### Association

- belongs_to :user
- has_one    :product_purchase_user

## product_purchases_users テーブル
| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null: false foreign_key: true |
| product_listing  | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product_listing
- has_one    :product_purchase

## product_purchases テーブル
| Column                | Type       | Option                        |
| --------------------- | ---------- | ----------------------------- |
| post                  | string     | null: false                   |
| area_id               | integer    | null: false                   |
| municipality          | string     | null: false                   |
| address               | string     | null: false                   |
| building              | string     | null: true                    |
| phone_number          | string     | null: false                   |
| product_purchase_user | references | null: false foreign_key: true |

### Association

- belongs_to :product_purchases_users